SET (CART_SERVICE "cart_service")

if(NOT ${Poco_FOUND})
    message(FATAL_ERROR "Poco C++ Libraries not found.")
endif()

include_directories(${Poco_INCLUDE_DIRS})

add_executable(cart_service
        include/request_handler_factory.h
        include/service_initializer.h
        src/request_handler_factory.cpp
        src/service_initializer.cpp
        main.cpp
        src/cart_base.cpp
        include/cart_base.h
        src/cart.cpp 
        include/cart.h)

target_include_directories(${CART_SERVICE} PUBLIC utils include)
target_compile_options(${CART_SERVICE} PUBLIC -Wall -Wextra -pedantic -Werror )

target_link_libraries(${CART_SERVICE} PUBLIC 
                             ${CMAKE_THREAD_LIBS_INIT} 
                             ${Poco_LIBRARIES}
                             "PocoDataMySQL"
                             "rdkafka++"
                             redis++::redis++
                             CppKafka::cppkafka
                             "mysqlclient"
                             ZLIB::ZLIB
                             utils)

set_target_properties(${CART_SERVICE} PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(${CART_SERVICE} PROPERTIES CXX_STANDARD 17 CXX_STANDARD_REQUIRED ON)