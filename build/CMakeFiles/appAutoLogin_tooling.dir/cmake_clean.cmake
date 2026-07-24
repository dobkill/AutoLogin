file(REMOVE_RECURSE
  "AutoLogin/src/qml/Main.qml"
  "AutoLogin/src/qml/components/AppHeader.qml"
  "AutoLogin/src/qml/components/AppSidebar.qml"
  "AutoLogin/src/qml/components/Theme.qml"
  "AutoLogin/src/qml/components/UiButton.qml"
  "AutoLogin/src/qml/components/UiCard.qml"
  "AutoLogin/src/qml/components/UiCheckBox.qml"
  "AutoLogin/src/qml/components/UiComboBox.qml"
  "AutoLogin/src/qml/components/UiSwitch.qml"
  "AutoLogin/src/qml/components/UiTextField.qml"
  "AutoLogin/src/qml/pages/HomePage.qml"
  "AutoLogin/src/qml/pages/LoginPage.qml"
  "AutoLogin/src/qml/pages/NetworkPage.qml"
  "AutoLogin/src/qml/pages/SettingsPage.qml"
  "AutoLogin/src/qml/pages/SiteManagerPage.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/appAutoLogin_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
