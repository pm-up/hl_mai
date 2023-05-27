cmake_minimum_required(VERSION 3.2)

project(hl_server C CXX)

SET (AUTH_SERVICE "auth_service")
SET (CART_SERVICE "cart_service")
SET (PRODUCT_SERVICE "product_service")

find_package(OpenSSL)
find_package(Threads)
find_package(ZLIB)
find_package(Poco REQUIRED COMPONENTS Foundation Util Net XML JSON Crypto NetSSL)
find_package(CppKafka REQUIRED)



if(NOT ${Poco_FOUND})
    message(FATAL_ERROR "Poco C++ Libraries not found.")
endif()

include_directories(${Poco_INCLUDE_DIRS})
include_directories("/usr/include/mysql")
include_directories("/usr/local/include/mysql")
link_directories("/usr/local/lib")

SET(CMAKE_CXX_STANDARD 17)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(${AUTH_SERVICE} auth_service/main.cpp 
                                 auth_service/src/authentication_common.cpp
                                 auth_service/src/kafka_config.cpp
                                 auth_service/src/request_handler_factory.cpp
                                 auth_service/src/service_initializer.cpp
                                 auth_service/src/user_cache.cpp
                                 auth_service/src/user_validator.cpp
                                 auth_service/src/user_base.cpp
                                 auth_service/src/user.cpp)


target_include_directories(${AUTH_SERVICE} PRIVATE "${CMAKE_BINARY_DIR}")
target_compile_options(${AUTH_SERVICE} PRIVATE -Wall -Wextra -pedantic -Werror )
set_target_properties(${AUTH_SERVICE} PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(${AUTH_SERVICE} PROPERTIES CXX_STANDARD 17 CXX_STANDARD_REQUIRED ON)

target_link_libraries(${AUTH_SERVICE} PRIVATE 
                             ${CMAKE_THREAD_LIBS_INIT} 
                             ${Poco_LIBRARIES}
                             "PocoData"
                             "PocoDataMySQL"
                             "mysqlclient"
                             ZLIB::ZLIB)

add_executable(${CART_SERVICE}   cart_service/main.cpp 
                                 cart_service/src/request_handler_factory.cpp
                                 cart_service/src/service_initializer.cpp
                                 cart_service/src/cart_base.cpp
                                 cart_service/src/cart.cpp)

target_include_directories(${CART_SERVICE} PRIVATE "${CMAKE_BINARY_DIR}")
target_compile_options(${CART_SERVICE} PRIVATE -Wall -Wextra -pedantic -Werror )
set_target_properties(${CART_SERVICE} PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(${CART_SERVICE} PROPERTIES CXX_STANDARD 17 CXX_STANDARD_REQUIRED ON)

target_link_libraries(${CART_SERVICE} PRIVATE 
                             ${CMAKE_THREAD_LIBS_INIT} 
                             ${Poco_LIBRARIES}
                             "PocoData"
                             "PocoDataMySQL"
                             "mysqlclient"
                             ZLIB::ZLIB)

add_executable(${PRODUCT_SERVICE} product_service/main.cpp 
                                 product_service/src/product_base.cpp
                                 product_service/src/product_validator.cpp
                                 product_service/src/product.cpp
                                 product_service/src/request_handler_factory.cpp
                                 product_service/src/service_initializer.cpp)

target_include_directories(${PRODUCT_SERVICE} PRIVATE "${CMAKE_BINARY_DIR}")
target_compile_options(${PRODUCT_SERVICE} PRIVATE -Wall -Wextra -pedantic -Werror )
set_target_properties(${PRODUCT_SERVICE} PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(${PRODUCT_SERVICE} PROPERTIES CXX_STANDARD 17 CXX_STANDARD_REQUIRED ON)

target_link_libraries(${PRODUCT_SERVICE} PRIVATE 
                             ${CMAKE_THREAD_LIBS_INIT} 
                             ${Poco_LIBRARIES}
                             "PocoData"
                             "PocoDataMySQL"
                             "mysqlclient"
                             ZLIB::ZLIB)