#include "cpp/product_service/include/request_handler_factory.h"
#include "cpp/product_service/include/service_initializer.h"

#include <cpp/utils/include/http_web_server.h>

int main(int argc, char **argv) {
    HttpWebServer<ServiceInitializer, RequestHandlerFactory> server;
    server.run(argc, argv);
    return 0;
}
