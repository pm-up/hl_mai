#pragma once

#include "utils/include/i_service_initializer.h"

class ServiceInitializer : public IServiceInitializer {
public:
    void initialize() override;
};
