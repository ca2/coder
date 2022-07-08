cmake_minimum_required(VERSION 3.16)
project(for_coder_coder CXX)


list(APPEND library_source
        _.cpp
   4ed_api_check.cpp
   4ed_api_definition.cpp
   )


add_library(for_coder_coder SHARED ${library_source})

target_precompile_headers(for_coder_coder PRIVATE framework.h)

set_target_properties(for_coder_coder PROPERTIES LINKER_LANGUAGE CXX)


list(APPEND library_references
   acme
   apex
   aqua
   aura
   axis
   base
   )


if (MSVC)

   target_compile_options(for_coder_coder PRIVATE "/MD$<$<CONFIG:Debug>:d>")
   target_link_options(for_coder_coder PRIVATE "/DEFAULTLIB:msvcrt$<$<CONFIG:Debug>:d>")
   target_link_options(for_coder_coder PRIVATE "/SUBSYSTEM:WINDOWS")
   target_link_libraries(for_coder_coder PRIVATE ${library_references})

elseif(LINUX OR FREEBSD)

   target_compile_options(for_coder_coder PRIVATE -fpermissive)
   #target_link_options(for_coder_coder PRIVATE -Wl,-rpath=$ORIGIN)
   target_link_libraries(for_coder_coder PRIVATE ${library_references})
   target_link_options(for_coder_coder PRIVATE -Wl,-z,defs)

endif ()




target_link_directories(for_coder_coder PRIVATE ${library_link_directories})


list(APPEND library_include_directories ${CMAKE_CURRENT_SOURCE_DIR}/../..)
list(APPEND library_include_directories ${CMAKE_CURRENT_SOURCE_DIR}/..)
list(APPEND library_include_directories ${CMAKE_CURRENT_SOURCE_DIR})


target_include_directories(${PROJECT_NAME} PRIVATE ${library_include_directories})


target_compile_definitions(for_coder_coder PRIVATE _APP_SIMPLE_DRAWING_LIBRARY)


add_executable(_${PROJECT_NAME} _main.cpp)


if(LINUX OR FREEBSD)
#
#   add_custom_command(
#      COMMAND ${APPLICATION_BUILD_HELPER} ${PROJECT_SOURCE_DIR}
#      COMMAND ${CMAKE_COMMAND} -E touch ${PROJECT_BINARY_DIR}/matter.timestamp
#      OUTPUT ${PROJECT_BINARY_DIR}/matter.timestamp
#      WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
#      BYPRODUCTS ${PROJECT_SOURCE_DIR}/.link_object/_matter.zip.o
#      DEPENDS application_matter.txt matter.txt _console_application_build_helper
#      VERBATIM
#      )
#
#   add_custom_target(${PROJECT_NAME}_matter
#      DEPENDS ${PROJECT_BINARY_DIR}/matter.timestamp
#   )
#
list(APPEND executable_references ${PROJECT_SOURCE_DIR}/.link_object/_matter.zip.o)
#
#   add_dependencies(${PROJECT_NAME} ${PROJECT_NAME}_matter)
#
endif()



list(APPEND executable_references
   acme
   apex
   aqua
   aura
   axis
   base
   for_coder_coder)




if (MSVC)

   target_compile_options(_${PROJECT_NAME} PRIVATE "/MD$<$<CONFIG:Debug>:d>")
   target_link_options(_${PROJECT_NAME} PRIVATE "/DEFAULTLIB:msvcrt$<$<CONFIG:Debug>:d>")
   target_link_options(_${PROJECT_NAME} PRIVATE "/SUBSYSTEM:WINDOWS")
   target_link_libraries(_${PROJECT_NAME} PRIVATE ${executable_references})

elseif(LINUX OR FREEBSD)

   target_compile_options(_${PROJECT_NAME} PRIVATE -fpermissive)
   #target_link_options(_${PROJECT_NAME} PRIVATE -Wl,-rpath=$ORIGIN)
   target_link_libraries(_${PROJECT_NAME} PRIVATE ${executable_references})
   target_link_options(_${PROJECT_NAME} PRIVATE -Wl,-z,defs)

endif ()


add_dependencies(_${PROJECT_NAME} ${default_draw2d})
add_dependencies(_${PROJECT_NAME} ${default_imaging})
add_dependencies(_${PROJECT_NAME} ${default_write_text})
#add_dependencies(_${PROJECT_NAME} ${app_common_dependencies})
add_dependencies(_${PROJECT_NAME} ${default_node})
add_dependencies(_${PROJECT_NAME} crypto_openssl)
add_dependencies(_${PROJECT_NAME} experience_core)
add_dependencies(_${PROJECT_NAME} folder_zip)


target_include_directories(_${PROJECT_NAME} PRIVATE ${library_include_directories})

target_link_directories(_${PROJECT_NAME} PRIVATE ${library_link_directories})

set_target_properties(_${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)



