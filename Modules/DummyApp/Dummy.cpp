#include <stdio.h>
#include "Dummy.hpp"
#include "FreeRTOS.h"
#include "task.h"
#include "stm32n6xx_hal.h"
#include "stm32n6xx_nucleo.h"

static StaticTask_t main_thread;
static StackType_t main_thread_stack[configMINIMAL_STACK_SIZE];

static void main_thread_fct(void *arg)
{
  TickType_t last_tick = xTaskGetTickCount();
  TickType_t xFrequency = 200;

  printf("Entering Dummy FreeRTOS Thread\n");

  while (1)
  {
    BSP_LED_Toggle(LED_BLUE);
    xTaskDelayUntil(&last_tick, xFrequency);
  }

  printf("Exiting Dummy FreeRTOS Thread\n");

  vTaskDelete(NULL);
}

void dummy_func()
{
  TaskHandle_t hdl;
  hdl = xTaskCreateStatic(main_thread_fct, "dummy", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1,
                          main_thread_stack, &main_thread);
  assert(hdl != NULL);
  printf("Dummy Func\n");
}
