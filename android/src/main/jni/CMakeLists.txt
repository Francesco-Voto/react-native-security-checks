cmake_minimum_required(VERSION 3.4.1)

set( SOURCE_LIB native-checker.c
        ../c/checker_modules.c
)

add_library( # Sets the name of the library.
        native-checker
        SHARED
        ${SOURCE_LIB}
)

set_target_properties(native-checker PROPERTIES
    LINK_FLAGS "-Wl,-z,max-page-size=16384"
)

target_link_libraries(
        native-checker
)
