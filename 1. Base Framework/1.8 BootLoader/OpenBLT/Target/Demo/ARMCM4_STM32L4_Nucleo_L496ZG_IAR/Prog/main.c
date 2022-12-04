/************************************************************************************//**
* \file         Demo/ARMCM4_STM32L4_Nucleo_L496ZG_IAR/Prog/main.c
* \brief        Demo program application source file.
* \ingroup      Prog_ARMCM4_STM32L4_Nucleo_L496ZG_IAR
* \internal
*----------------------------------------------------------------------------------------
*                          C O P Y R I G H T
*----------------------------------------------------------------------------------------
*   Copyright (c) 2021  by Feaser    http://www.feaser.com    All rights reserved
*
*----------------------------------------------------------------------------------------
*                            L I C E N S E
*----------------------------------------------------------------------------------------
* This file is part of OpenBLT. OpenBLT is free software: you can redistribute it and/or
* modify it under the terms of the GNU General Public License as published by the Free
* Software Foundation, either version 3 of the License, or (at your option) any later
* version.
*
* OpenBLT is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
* without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
* PURPOSE. See the GNU General Public License for more details.
*
* You have received a copy of the GNU General Public License along with OpenBLT. It
* should be located in ".\Doc\license.html". If not, contact Feaser to obtain a copy.
*
* \endinternal
****************************************************************************************/

/****************************************************************************************
* Include files
****************************************************************************************/
#include "header.h"                                    /* generic header               */


/****************************************************************************************
* Function prototypes
****************************************************************************************/
static void Init(void);
static void SystemClock_Config(void);
static void VectorBase_Config(void);


/************************************************************************************//**
** \brief     This is the entry point for the bootloader application and is called
**            by the reset interrupt vector after the C-startup routines executed.
** \return    none.
**
****************************************************************************************/
void main(void)
{
  /* Initialize the microcontroller */
  Init();
  /* Initialize the bootloader interface */
  BootComInit();

  /* start the infinite program loop */
  while (1)
  {
    /* Toggle LED with a fixed frequency. */
    LedToggle();
    /* Check for bootloader activation request. */
    BootComCheckActivationRequest();
  }
} /*** end of main ***/


/************************************************************************************//**
** \brief     Initializes the microcontroller.
** \return    none.
**
****************************************************************************************/
static void Init(void)
{
  /* Configure the vector table base address. */
  VectorBase_Config();
  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();
  /* Configure the system clock. */
  SystemClock_Config();
  /* Initialize the timer driver. */
  TimerInit();
  /* Initialize the led driver. */
  LedInit();
} /*** end of Init ***/


/************************************************************************************//**
** \brief     Vector base address configuration. It should no longer be at the start of
**            flash memory but moved forward because the first part of flash is
**            reserved for the bootloader. Note that this is already done by the
**            bootloader before starting this program. Unfortunately, function
**            SystemInit() overwrites this change again. 
** \return    none.
**
****************************************************************************************/
static void VectorBase_Config(void)
{
  /* The constant array with vectors of the vector table is declared externally in the
   * c-startup code.
   */
  extern const unsigned long __vector_table[];

  /* Remap the vector table to where the vector table is located for this program. */
  SCB->VTOR = (unsigned long)&__vector_table[0];
} /*** end of VectorBase_Config ***/


/************************************************************************************//**
** \brief     System Clock Configuration. This code was created by CubeMX and configures
**            the system clock.
** \return    none.
**
****************************************************************************************/
static void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = { 0 };
  RCC_ClkInitTypeDef RCC_ClkInitStruct = { 0 };

  /* Configure the main internal regulator output voltage. */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1) != HAL_OK)
  {
    /* Configuration of the regulator output voltage incorrect or hardware failure. Hang
     * the system to prevent damage.
     */
    while(1);
  }

  /* Initializes the RCC Oscillators according to the specified parameters in the
   * RCC_OscInitTypeDef structure.
   */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 2;
  RCC_OscInitStruct.PLL.PLLN = 20;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    /* Clock configuration incorrect or hardware failure. Hang the system to prevent
     * damage.
     */
    while(1);
  }

  /* Initializes the CPU, AHB and APB buses clocks. */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK |
                                RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
  {
    /* Clock configuration incorrect or hardware failure. Hang the system to prevent
     * damage.
     */
    while(1);
  }
} /*** end of SystemClock_Config ***/


/************************************************************************************//**
** \brief     Initializes the Global MSP. This function is called from HAL_Init()
**            function to perform system level initialization (GPIOs, clock, DMA,
**            interrupt).
** \return    none.
**
****************************************************************************************/
void HAL_MspInit(void)
{
  GPIO_InitTypeDef GPIO_InitStruct;

  /* Power and SYSCFG clock enable. */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_RCC_SYSCFG_CLK_ENABLE();
  
  /* GPIO ports clock enable. */
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOG_CLK_ENABLE();
#if (BOOT_COM_RS232_ENABLE > 0)
  /* Peripheral clock enable. */
  HAL_PWREx_EnableVddIO2();
  __HAL_RCC_LPUART1_CLK_ENABLE();
#endif /* BOOT_COM_RS232_ENABLE > 0 */

  /* Configure the LED GPIO pin. */
  GPIO_InitStruct.Pin = GPIO_PIN_7;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
#if (BOOT_COM_RS232_ENABLE > 0)
  /* UART TX and RX GPIO pin configuration. */
  GPIO_InitStruct.Pin = GPIO_PIN_7 | GPIO_PIN_8;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = GPIO_AF8_LPUART1;
  HAL_GPIO_Init(GPIOG, &GPIO_InitStruct);
#endif /* BOOT_COM_RS232_ENABLE > 0 */
} /*** end of HAL_MspInit ***/


/************************************************************************************//**
** \brief     Deinitializes the Global MSP. This function is called from HAL_DeInit()
**            function to perform system level Deinitialization (GPIOs, clock, DMA,
**            interrupt).
** \return    none.
**
****************************************************************************************/
void HAL_MspDeInit(void)
{
#if (BOOT_COM_RS232_ENABLE > 0)
  /* Reset UART GPIO pin configuration. */
  HAL_GPIO_DeInit(GPIOG, GPIO_PIN_7 | GPIO_PIN_8);
#endif /* BOOT_COM_RS232_ENABLE > 0 */
  /* Deconfigure GPIO pin for the LED. */
  HAL_GPIO_WritePin(GPIOB, GPIO_PIN_7, GPIO_PIN_RESET);
  HAL_GPIO_DeInit(GPIOB, GPIO_PIN_7);

#if (BOOT_COM_RS232_ENABLE > 0)
  /* Peripheral clock disable. */
  __HAL_RCC_LPUART1_CLK_DISABLE();
  HAL_PWREx_DisableVddIO2();
#endif /* BOOT_COM_RS232_ENABLE > 0 */
  /* GPIO ports clock disable. */
  __HAL_RCC_GPIOG_CLK_DISABLE();
  __HAL_RCC_GPIOB_CLK_DISABLE();
  /* Power and SYSCFG clock disable. */
  __HAL_RCC_PWR_CLK_DISABLE();
  __HAL_RCC_SYSCFG_CLK_DISABLE();
} /*** end of HAL_MspDeInit ***/


/*********************************** end of main.c *************************************/
