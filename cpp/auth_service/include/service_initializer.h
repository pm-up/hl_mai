#pragma once

//#include "cpp/utils/include/i_service_initializer.h"
#include "i_service_initializer.h"

class ServiceInitializer : public IServiceInitializer {
public:
    void initialize() override;
};
