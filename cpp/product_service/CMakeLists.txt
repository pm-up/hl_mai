SET (PRODUCT_SERVICE "product_service")

if(NOT ${Poco_FOUND})
    message(FATAL_ERROR "Poco C++ Libraries not found.")
endif()

include_directories(${Poco_INCLUDE_DIRS})

add_executable(${PRODUCT_SERVICE}
        include/product.h
        include/product_base.h
        include/product_validator.h
        include/request_handler_factory.h
        include/service_initializer.h
        src/product.cpp
        src/product_base.cpp
        src/product_validator.cpp
        src/request_handler_factory.cpp
        src/service_initializer.cpp
        main.cpp)

target_include_directories(${PRODUCT_SERVICE} PUBLIC utils include)
target_compile_options(${PRODUCT_SERVICE} PUBLIC -Wall -Wextra -pedantic -Werror )

target_link_libraries(${PRODUCT_SERVICE} PUBLIC 
                             ${CMAKE_THREAD_LIBS_INIT} 
                             ${Poco_LIBRARIES}
                             "PocoDataMySQL"
                             "rdkafka++"
                             redis++::redis++
                             CppKafka::cppkafka
                             "mysqlclient"
                             ZLIB::ZLIB
                             utils)

set_target_properties(${PRODUCT_SERVICE} PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(${PRODUCT_SERVICE} PROPERTIES CXX_STANDARD 17 CXX_STANDARD_REQUIRED ON)
