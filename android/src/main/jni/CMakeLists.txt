cmake_minimum_required(VERSION 3.4.1)

set( SOURCE_LIB native-checker.c
        ../c/checker_modules.c
)

add_library( # Sets the name of the library.
        native-checker
        SHARED
        ${SOURCE_LIB}
)

# refer
# - https://developer.android.com/about/versions/15/behavior-changes-all#16-kb
# - https://developer.android.google.cn/about/versions/15/behavior-changes-all?hl=zh-cn#16-kb
if(ANDROID_ABI STREQUAL "arm64-v8a" OR ANDROID_ABI STREQUAL "x86_64")
    target_link_options(native-checker PRIVATE -Wl,-z,max-page-size=16384)
endif()

target_link_libraries(
        native-checker
)
