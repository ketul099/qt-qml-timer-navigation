# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appQtTimerApp_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appQtTimerApp_autogen.dir\\ParseCache.txt"
  "appQtTimerApp_autogen"
  )
endif()
