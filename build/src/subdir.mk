
# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/coap.cpp \
../src/handshake.cpp \
../src/spark_protocol.cpp 

OBJS += \
./src/coap.o \
./src/handshake.o \
./src/spark_protocol.o 

CPP_DEPS += \
./src/coap.d \
./src/handshake.d \
./src/spark_protocol.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Sourcery Windows GCC C++ Compiler'
	arm-none-eabi-g++ -I"../lib/tropicssl/include" -I"../src" -Os -ffunction-sections -Wall -fno-exceptions -fno-rtti -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -mcpu=cortex-m3 -mthumb -g3 -gdwarf-2 -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

