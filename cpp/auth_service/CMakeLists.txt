SET (AUTH_SERVICE "auth_service")

find_package(OpenSSL)
find_package(Threads)
find_package(Poco REQUIRED COMPONENTS Foundation Util Net XML JSON Crypto NetSSL Data)
find_package(CppKafka REQUIRED)

if(NOT ${Poco_FOUND})
    message(FATAL_ERROR "Poco C++ Libraries not found.")
endif()

include_directories(${Poco_INCLUDE_DIRS})

add_executable(auth_service
        include/authentication_common.h
        include/kafka_config.h
        include/request_handler_factory.h
        include/service_initializer.h
        include/user.h
        include/user_base.h
        include/user_cache.h
        include/user_validator.h
        src/authentication_common.cpp
        src/kafka_config.cpp
        src/request_handler_factory.cpp
        src/service_initializer.cpp
        src/user.cpp
        src/user_base.cpp
        src/user_cache.cpp
        src/user_validator.cpp
        main.cpp)

target_include_directories(${AUTH_SERVICE} PRIVATE utils include)
target_compile_options(${AUTH_SERVICE} PRIVATE -Wall -Wextra -pedantic -Werror )

target_link_libraries(${AUTH_SERVICE} PRIVATE 
                             ${CMAKE_THREAD_LIBS_INIT} 
                             ${Poco_LIBRARIES}
                             "PocoDataMySQL"
                             "rdkafka++"
                             redis++::redis++
                             CppKafka::cppkafka
                             "mysqlclient"
                             ZLIB::ZLIB
                             utils)

set_target_properties(${AUTH_SERVICE} PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(${AUTH_SERVICE} PROPERTIES CXX_STANDARD 17 CXX_STANDARD_REQUIRED ON)