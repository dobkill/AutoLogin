import QtQuick
import QtWebEngine

WebEngineView {
    id: root

    property bool recording: false
    property string message: ""

    signal eventCaptured(var event)
    signal pageUrlChanged(string url)

    function open(targetUrl) {
        url = targetUrl
    }

    function injectRecorderScript() {
        runJavaScript(recorderInstallScript(), function(ok) {
            if (ok && root.recording)
                root.message = "录制中：请在页面里完成一次登录操作"
        })
    }

    function drainRecorderEvents() {
        if (!root.recording)
            return
        runJavaScript("(function(){var e=window.__autoLoginEvents||[];window.__autoLoginEvents=[];return e;})()", function(events) {
            if (!events || events.length === undefined)
                return
            for (var i = 0; i < events.length; ++i)
                root.eventCaptured(events[i])
        })
    }

    function recorderInstallScript() {
        return `(function() {
            if (window.__autoLoginRecorderInstalled)
                return true;
            window.__autoLoginEvents = window.__autoLoginEvents || [];

            function quoteXPath(value) {
                if (value.indexOf("'") < 0)
                    return "'" + value + "'";
                if (value.indexOf('"') < 0)
                    return '"' + value + '"';
                return "concat('" + value.replace(/'/g, "',\"'\",'") + "')";
            }

            function xpathFor(element) {
                if (!element || element.nodeType !== 1)
                    return "";
                if (element.id)
                    return "//*[@id=" + quoteXPath(element.id) + "]";

                var parts = [];
                for (var node = element; node && node.nodeType === 1; node = node.parentElement) {
                    var tag = node.localName.toLowerCase();
                    var index = 1;
                    for (var sibling = node.previousElementSibling; sibling; sibling = sibling.previousElementSibling) {
                        if (sibling.localName && sibling.localName.toLowerCase() === tag)
                            index++;
                    }
                    parts.unshift(tag + "[" + index + "]");
                }
                return "/" + parts.join("/");
            }

            function editable(element) {
                if (!element)
                    return false;
                var tag = element.tagName ? element.tagName.toLowerCase() : "";
                return tag === "input" || tag === "textarea" || tag === "select" || element.isContentEditable;
            }

            function valueOf(element) {
                if (!element)
                    return "";
                if (element.isContentEditable)
                    return element.innerText || "";
                return element.value === undefined ? "" : String(element.value);
            }

            function push(type, element) {
                var xpath = xpathFor(element);
                if (!xpath)
                    return;
                window.__autoLoginEvents.push({
                    type: type,
                    xpath: xpath,
                    value: type === "input" ? valueOf(element) : "",
                    url: location.href
                });
            }

            document.addEventListener("click", function(event) {
                if (!editable(event.target))
                    push("click", event.target);
            }, true);
            document.addEventListener("change", function(event) {
                if (editable(event.target))
                    push("input", event.target);
            }, true);
            document.addEventListener("blur", function(event) {
                if (editable(event.target))
                    push("input", event.target);
            }, true);

            window.__autoLoginRecorderInstalled = true;
            return true;
        })();`
    }

    onUrlChanged: {
        root.pageUrlChanged(String(url))
        injectRecorderScript()
    }

    onLoadingChanged: function(loadRequest) {
        if (loadRequest.status === WebEngineView.LoadSucceededStatus) {
            root.pageUrlChanged(String(url))
            injectRecorderScript()
        } else if (loadRequest.status === WebEngineView.LoadFailedStatus) {
            root.message = "页面加载失败：" + loadRequest.errorString
        }
    }

    Timer {
        interval: 350
        repeat: true
        running: root.recording
        onTriggered: root.drainRecorderEvents()
    }
}
