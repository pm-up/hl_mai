cmake_minimum_required(VERSION 3.20)

project(HighloadHW CXX)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

message(${CMAKE_MODULE_PATH})

set(CMAKE_CXX_STANDARD 17)

if (MSVC)
    add_compile_options(/W4 /WX)
else ()
    add_compile_options(-Wall -Wextra -pedantic -Werror)
endif ()

find_package(Poco)
find_package(redis++)
find_package(CppKafka)

add_subdirectory(utils)

add_subdirectory(auth_service)
add_subdirectory(product_service)
add_subdirectory(cart_service)
