# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appLogin_wifi_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appLogin_wifi_autogen.dir\\ParseCache.txt"
  "appLogin_wifi_autogen"
  )
endif()
