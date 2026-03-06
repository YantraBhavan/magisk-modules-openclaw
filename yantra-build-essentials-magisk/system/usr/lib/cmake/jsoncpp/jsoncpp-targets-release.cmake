#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "jsoncpp_lib" for configuration "Release"
set_property(TARGET jsoncpp_lib APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(jsoncpp_lib PROPERTIES
  IMPORTED_LOCATION_RELEASE "/data/data/com.termux/files/usr/lib/libjsoncpp.so"
  IMPORTED_SONAME_RELEASE "libjsoncpp.so"
  )

list(APPEND _cmake_import_check_targets jsoncpp_lib )
list(APPEND _cmake_import_check_files_for_jsoncpp_lib "/data/data/com.termux/files/usr/lib/libjsoncpp.so" )

# Import target "jsoncpp_static" for configuration "Release"
set_property(TARGET jsoncpp_static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(jsoncpp_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "/data/data/com.termux/files/usr/lib/libjsoncpp.a"
  )

list(APPEND _cmake_import_check_targets jsoncpp_static )
list(APPEND _cmake_import_check_files_for_jsoncpp_static "/data/data/com.termux/files/usr/lib/libjsoncpp.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
