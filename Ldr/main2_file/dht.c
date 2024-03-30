#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>
#include <bl_timer.h>
#include <bl_gpio.h>
#include "color.h"
#include <stdlib.h>

#define DHT_PIN 17

#define ENABLE_PULLUP 1
#define ENABLE_PULLDOWN 1
#define DISABLE_PULLUP 0
#define DISABLE_PULLDOWN 0
uint16_t humidity;
int16_t temp;
extern int buzz;
void initiateGPIO()
{
  bl_gpio_enable_output(DHT_PIN, DISABLE_PULLUP, DISABLE_PULLDOWN);
}
void sendStartSignal()
{
  bl_gpio_output_set(DHT_PIN, 0);
  vTaskDelay(1 / portTICK_PERIOD_MS);

  bl_gpio_output_set(DHT_PIN, 1);
  bl_timer_delay_us(30);
}

void task_dht(void *pvParameters)
{

  while (1)
  {
    initiateGPIO();
    uint8_t data[5] = {0};
    sendStartSignal();

    bl_gpio_enable_input(DHT_PIN, DISABLE_PULLUP, DISABLE_PULLDOWN);

    while (bl_gpio_input_get_value(DHT_PIN) == 1)
      ;
    while (bl_gpio_input_get_value(DHT_PIN) == 0)
      ;
    while (bl_gpio_input_get_value(DHT_PIN) == 1)
      ;

    for (int i = 0; i < 40; i++)
    {
      while (bl_gpio_input_get_value(DHT_PIN) == 0)
        ;

      bl_timer_delay_us(30);

      if (bl_gpio_input_get_value(DHT_PIN))
      {
        data[i / 8] |= (1 << (7 - (i % 8)));
      }

      while (bl_gpio_input_get_value(DHT_PIN) == 1)
        ;
    }
    humidity = (data[0] << 8 | data[1]);
    temp = (data[2] << 8 | data[3]);
    uint8_t checksum = data[4];

    // printf("\e[1;1H\e[2J");

    if ((data[0] + data[1] + data[2] + data[3]) == checksum)
    {

      if (temp & 0x8000)
      {
        temp = -temp;
        printf(RED "Temperature: %d.%d *C\r\n", temp / 10, abs(temp % 10));
      }
      else
      {
        printf(CYAN "Temperature: %d.%d *C\r\n", temp / 10, temp % 10);
      }

      printf(YELLOW "Humidity: %d.%d \r\n", humidity / 10, humidity % 10);
      printf(RESET);
    }
    else
    {
      printf(CYAN"Temperature: %d.%d *C\r\n", temp / 10, temp % 10);
      printf(YELLOW"Humidity: %d.%d \r\n", humidity / 10, humidity % 10);
      printf(RESET);
    }

    vTaskDelay(10000 / ((TickType_t)1000 / ((TickType_t)1000)));
  }

  vTaskDelete(NULL);
}
