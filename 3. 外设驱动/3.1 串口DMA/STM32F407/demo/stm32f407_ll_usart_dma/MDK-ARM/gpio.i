# 1 "../Core/Src/gpio.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 387 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../Core/Src/gpio.c" 2
# 22 "../Core/Src/gpio.c"
# 1 "../Core/Inc\\gpio.h" 1
# 29 "../Core/Inc\\gpio.h"
# 1 "../Core/Inc/main.h" 1
# 31 "../Core/Inc/main.h"
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h" 1
# 28 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
# 1 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include\\stm32f4xx.h" 1
# 132 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include\\stm32f4xx.h"
# 1 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h" 1
# 65 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h"
typedef enum
{

  NonMaskableInt_IRQn = -14,
  MemoryManagement_IRQn = -12,
  BusFault_IRQn = -11,
  UsageFault_IRQn = -10,
  SVCall_IRQn = -5,
  DebugMonitor_IRQn = -4,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,

  WWDG_IRQn = 0,
  PVD_IRQn = 1,
  TAMP_STAMP_IRQn = 2,
  RTC_WKUP_IRQn = 3,
  FLASH_IRQn = 4,
  RCC_IRQn = 5,
  EXTI0_IRQn = 6,
  EXTI1_IRQn = 7,
  EXTI2_IRQn = 8,
  EXTI3_IRQn = 9,
  EXTI4_IRQn = 10,
  DMA1_Stream0_IRQn = 11,
  DMA1_Stream1_IRQn = 12,
  DMA1_Stream2_IRQn = 13,
  DMA1_Stream3_IRQn = 14,
  DMA1_Stream4_IRQn = 15,
  DMA1_Stream5_IRQn = 16,
  DMA1_Stream6_IRQn = 17,
  ADC_IRQn = 18,
  CAN1_TX_IRQn = 19,
  CAN1_RX0_IRQn = 20,
  CAN1_RX1_IRQn = 21,
  CAN1_SCE_IRQn = 22,
  EXTI9_5_IRQn = 23,
  TIM1_BRK_TIM9_IRQn = 24,
  TIM1_UP_TIM10_IRQn = 25,
  TIM1_TRG_COM_TIM11_IRQn = 26,
  TIM1_CC_IRQn = 27,
  TIM2_IRQn = 28,
  TIM3_IRQn = 29,
  TIM4_IRQn = 30,
  I2C1_EV_IRQn = 31,
  I2C1_ER_IRQn = 32,
  I2C2_EV_IRQn = 33,
  I2C2_ER_IRQn = 34,
  SPI1_IRQn = 35,
  SPI2_IRQn = 36,
  USART1_IRQn = 37,
  USART2_IRQn = 38,
  USART3_IRQn = 39,
  EXTI15_10_IRQn = 40,
  RTC_Alarm_IRQn = 41,
  OTG_FS_WKUP_IRQn = 42,
  TIM8_BRK_TIM12_IRQn = 43,
  TIM8_UP_TIM13_IRQn = 44,
  TIM8_TRG_COM_TIM14_IRQn = 45,
  TIM8_CC_IRQn = 46,
  DMA1_Stream7_IRQn = 47,
  FSMC_IRQn = 48,
  SDIO_IRQn = 49,
  TIM5_IRQn = 50,
  SPI3_IRQn = 51,
  UART4_IRQn = 52,
  UART5_IRQn = 53,
  TIM6_DAC_IRQn = 54,
  TIM7_IRQn = 55,
  DMA2_Stream0_IRQn = 56,
  DMA2_Stream1_IRQn = 57,
  DMA2_Stream2_IRQn = 58,
  DMA2_Stream3_IRQn = 59,
  DMA2_Stream4_IRQn = 60,
  ETH_IRQn = 61,
  ETH_WKUP_IRQn = 62,
  CAN2_TX_IRQn = 63,
  CAN2_RX0_IRQn = 64,
  CAN2_RX1_IRQn = 65,
  CAN2_SCE_IRQn = 66,
  OTG_FS_IRQn = 67,
  DMA2_Stream5_IRQn = 68,
  DMA2_Stream6_IRQn = 69,
  DMA2_Stream7_IRQn = 70,
  USART6_IRQn = 71,
  I2C3_EV_IRQn = 72,
  I2C3_ER_IRQn = 73,
  OTG_HS_EP1_OUT_IRQn = 74,
  OTG_HS_EP1_IN_IRQn = 75,
  OTG_HS_WKUP_IRQn = 76,
  OTG_HS_IRQn = 77,
  DCMI_IRQn = 78,
  RNG_IRQn = 80,
  FPU_IRQn = 81
} IRQn_Type;







# 1 "../Drivers/CMSIS/Include\\core_cm4.h" 1
# 29 "../Drivers/CMSIS/Include\\core_cm4.h" 3





# 1 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 1 3
# 56 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 35 "../Drivers/CMSIS/Include\\core_cm4.h" 2 3
# 63 "../Drivers/CMSIS/Include\\core_cm4.h" 3
# 1 "../Drivers/CMSIS/Include/cmsis_version.h" 1 3
# 29 "../Drivers/CMSIS/Include/cmsis_version.h" 3
# 64 "../Drivers/CMSIS/Include\\core_cm4.h" 2 3
# 162 "../Drivers/CMSIS/Include\\core_cm4.h" 3
# 1 "../Drivers/CMSIS/Include/cmsis_compiler.h" 1 3
# 41 "../Drivers/CMSIS/Include/cmsis_compiler.h" 3
# 1 "../Drivers/CMSIS/Include/cmsis_armclang.h" 1 3
# 31 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3


# 1 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 1 3






# 1 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 1 3
# 39 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfi(void) {
  __builtin_arm_wfi();
}



static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfe(void) {
  __builtin_arm_wfe();
}



static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sev(void) {
  __builtin_arm_sev();
}



static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sevl(void) {
  __builtin_arm_sevl();
}



static __inline__ void __attribute__((__always_inline__, __nodebug__)) __yield(void) {
  __builtin_arm_yield();
}







static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__swp(uint32_t __x, volatile uint32_t *__p) {
  uint32_t v;
  do
    v = __builtin_arm_ldrex(__p);
  while (__builtin_arm_strex(__x, __p));
  return v;
}
# 107 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __nop(void) {
  __builtin_arm_nop();
}





static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__ror(uint32_t __x, uint32_t __y) {
  __y %= 32;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (32 - __y));
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rorll(uint64_t __x, uint32_t __y) {
  __y %= 64;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (64 - __y));
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rorl(unsigned long __x, uint32_t __y) {

  return __ror(__x, __y);



}



static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clz(uint32_t __t) {
  return __builtin_clz(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__clzl(unsigned long __t) {
  return __builtin_clzl(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__clzll(uint64_t __t) {
  return __builtin_clzll(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__cls(uint32_t __t) {
  return __builtin_arm_cls(__t);
}

static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clsl(unsigned long __t) {

  return __builtin_arm_cls(__t);



}

static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clsll(uint64_t __t) {
  return __builtin_arm_cls64(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev(uint32_t __t) {
  return __builtin_bswap32(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__revl(unsigned long __t) {

  return __builtin_bswap32(__t);



}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__revll(uint64_t __t) {
  return __builtin_bswap64(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev16(uint32_t __t) {
  return __ror(__rev(__t), 16);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rev16ll(uint64_t __t) {
  return (((uint64_t)__rev16(__t >> 32)) << 32) | __rev16(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rev16l(unsigned long __t) {

    return __rev16(__t);



}


static __inline__ int16_t __attribute__((__always_inline__, __nodebug__))
__revsh(int16_t __t) {
  return __builtin_bswap16(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rbit(uint32_t __t) {
  return __builtin_arm_rbit(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rbitll(uint64_t __t) {

  return (((uint64_t)__builtin_arm_rbit(__t)) << 32) |
         __builtin_arm_rbit(__t >> 32);



}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rbitl(unsigned long __t) {

  return __rbit(__t);



}





static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulbb(int32_t __a, int32_t __b) {
  return __builtin_arm_smulbb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulbt(int32_t __a, int32_t __b) {
  return __builtin_arm_smulbt(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smultb(int32_t __a, int32_t __b) {
  return __builtin_arm_smultb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smultt(int32_t __a, int32_t __b) {
  return __builtin_arm_smultt(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulwb(int32_t __a, int32_t __b) {
  return __builtin_arm_smulwb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulwt(int32_t __a, int32_t __b) {
  return __builtin_arm_smulwt(__a, __b);
}
# 292 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qadd(int32_t __t, int32_t __v) {
  return __builtin_arm_qadd(__t, __v);
}

static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qsub(int32_t __t, int32_t __v) {
  return __builtin_arm_qsub(__t, __v);
}

static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qdbl(int32_t __t) {
  return __builtin_arm_qadd(__t, __t);
}




static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlabb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlabb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlabt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlabt(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlatb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlatb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlatt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlatt(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlawb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlawb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlawt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlawt(__a, __b, __c);
}
# 345 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
typedef int32_t int8x4_t;
typedef int32_t int16x2_t;
typedef uint32_t uint8x4_t;
typedef uint32_t uint16x2_t;

static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sxtab16(int16x2_t __a, int8x4_t __b) {
  return __builtin_arm_sxtab16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sxtb16(int8x4_t __a) {
  return __builtin_arm_sxtb16(__a);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__uxtab16(int16x2_t __a, int8x4_t __b) {
  return __builtin_arm_uxtab16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__uxtb16(int8x4_t __a) {
  return __builtin_arm_uxtb16(__a);
}




static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__sel(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_sel(__a, __b);
}




static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__qadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_qadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__qsub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_qsub8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__sadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_sadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__shadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_shadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__shsub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_shsub8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__ssub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_ssub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uhadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uhadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uhsub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uhsub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uqadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uqadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uqsub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uqsub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__usub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_usub8(__a, __b);
}




static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__usad8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_usad8(__a, __b);
}
static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__usada8(uint8x4_t __a, uint8x4_t __b, uint32_t __c) {
  return __builtin_arm_usada8(__a, __b, __c);
}




static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qsax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qsax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qsub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qsub16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_sadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_sasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shsax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shsax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shsub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shsub16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__ssax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_ssax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__ssub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_ssub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhsax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhsax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhsub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhsub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqsax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqsax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqsub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqsub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__usax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_usax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__usub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_usub16(__a, __b);
}




static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlad(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlad(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smladx(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smladx(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlald(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlald(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlaldx(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlaldx(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlsd(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlsd(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlsdx(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlsdx(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlsld(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlsld(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlsldx(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlsldx(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smuad(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smuad(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smuadx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smuadx(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smusd(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smusd(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smusdx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smusdx(__a, __b);
}
# 8 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 2 3
# 40 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_fiq(void) {
  unsigned int cpsr;

  __asm__ __volatile__("mrs %[cpsr], faultmask\n"
                       "cpsid f\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 62 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_irq(void) {
  unsigned int cpsr;


  __asm__ __volatile__("mrs %[cpsr], primask\n"
                       "cpsid i\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 89 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}







static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_fiq(void) {

  __asm__ __volatile__("cpsie f");
# 109 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_irq(void) {

  __asm__ __volatile__("cpsie i");
# 124 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __force_stores(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __memory_changed(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __schedule_barrier(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static __inline__ int __attribute__((__always_inline__, __nodebug__))
__semihost(int val, const void *ptr) {
  register int v __asm__("r0") = val;
  register const void *p __asm__("r1") = ptr;
  __asm__ __volatile__(


      "bkpt 0xab"
# 160 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
      : "+r"(v), "+r"(p)
      :
      : "memory", "cc");
  return v;
}


static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__vfp_status(unsigned int mask, unsigned int flags) {
  unsigned int fpscr;
  __asm__ __volatile__("vmrs %[fpscr], fpscr" : [fpscr] "=r"(fpscr));
  unsigned int set = mask & flags;
  unsigned int clear = mask & ~flags;
  unsigned int toggle = ~mask & flags;
  fpscr |= set;
  fpscr &= ~clear;
  fpscr ^= toggle;
  __asm__ __volatile__("vmsr fpscr, %[fpscr]" : : [fpscr] "r"(fpscr));
  return fpscr;
}
# 34 "../Drivers/CMSIS/Include/cmsis_armclang.h" 2 3
# 68 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma clang diagnostic pop
# 142 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 172 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
}
# 196 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_PSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 268 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 292 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_MSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 322 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 373 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 403 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 446 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_BASEPRI(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, basepri" : "=r" (result) );
  return(result);
}
# 476 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI(uint32_t basePri)
{
  __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}
# 501 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  __asm volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory");
}







__attribute__((always_inline)) static __inline uint32_t __get_FAULTMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, faultmask" : "=r" (result) );
  return(result);
}
# 542 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 876 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 1021 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rrx %0, %1" : "=r" (result) : "r" (value) );
  return(result);
}
# 1036 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __LDRBT(volatile uint8_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint8_t) result);
}
# 1051 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint16_t __LDRHT(volatile uint16_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint16_t) result);
}
# 1066 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __LDRT(volatile uint32_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return(result);
}
# 1081 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRBT(uint8_t value, volatile uint8_t *ptr)
{
  __asm volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1093 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRHT(uint16_t value, volatile uint16_t *ptr)
{
  __asm volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1105 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRT(uint32_t value, volatile uint32_t *ptr)
{
  __asm volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
}
# 1324 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __SADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__attribute__((always_inline)) static __inline uint32_t __SSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__attribute__((always_inline)) static __inline uint32_t __SADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USAD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usad8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USADA8(uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("usada8 %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}
# 1644 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __UXTB16(uint32_t op1)
{
  uint32_t result;

  __asm volatile ("uxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SXTB16(uint32_t op1)
{
  uint32_t result;

  __asm volatile ("sxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMUAD (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smuad %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMUADX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smuadx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLAD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlad %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLADX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smladx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint64_t __SMLALD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlald %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint64_t __SMLALDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlaldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint32_t __SMUSD (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smusd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMUSDX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smusdx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLSD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlsd %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLSDX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlsdx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint64_t __SMLSLD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlsld %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint64_t __SMLSLDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlsldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint32_t __SEL (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sel %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline int32_t __QADD( int32_t op1, int32_t op2)
{
  int32_t result;

  __asm volatile ("qadd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline int32_t __QSUB( int32_t op1, int32_t op2)
{
  int32_t result;

  __asm volatile ("qsub %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}
# 1857 "../Drivers/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline int32_t __SMMLA (int32_t op1, int32_t op2, int32_t op3)
{
  int32_t result;

  __asm volatile ("smmla %0, %1, %2, %3" : "=r" (result): "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}
# 42 "../Drivers/CMSIS/Include/cmsis_compiler.h" 2 3
# 163 "../Drivers/CMSIS/Include\\core_cm4.h" 2 3
# 259 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef union
{
  struct
  {
    uint32_t _reserved0:16;
    uint32_t GE:4;
    uint32_t _reserved1:7;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;
# 298 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;
# 316 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:1;
    uint32_t ICI_IT_1:6;
    uint32_t GE:4;
    uint32_t _reserved1:4;
    uint32_t T:1;
    uint32_t ICI_IT_2:2;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;
# 371 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t FPCA:1;
    uint32_t _reserved0:29;
  } b;
  uint32_t w;
} CONTROL_Type;
# 406 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
  volatile uint32_t ISER[8U];
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];
        uint32_t RSERVED1[24U];
  volatile uint32_t ISPR[8U];
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];
        uint32_t RESERVED4[56U];
  volatile uint8_t IP[240U];
        uint32_t RESERVED5[644U];
  volatile uint32_t STIR;
} NVIC_Type;
# 440 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;
  volatile uint32_t VTOR;
  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
  volatile uint8_t SHP[12U];
  volatile uint32_t SHCSR;
  volatile uint32_t CFSR;
  volatile uint32_t HFSR;
  volatile uint32_t DFSR;
  volatile uint32_t MMFAR;
  volatile uint32_t BFAR;
  volatile uint32_t AFSR;
  volatile const uint32_t PFR[2U];
  volatile const uint32_t DFR;
  volatile const uint32_t ADR;
  volatile const uint32_t MMFR[4U];
  volatile const uint32_t ISAR[5U];
        uint32_t RESERVED0[5U];
  volatile uint32_t CPACR;
} SCB_Type;
# 719 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const uint32_t ICTR;
  volatile uint32_t ACTLR;
} SCnSCB_Type;
# 759 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;
# 811 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
  volatile union
  {
    volatile uint8_t u8;
    volatile uint16_t u16;
    volatile uint32_t u32;
  } PORT [32U];
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;
        uint32_t RESERVED3[29U];
  volatile uint32_t IWR;
  volatile const uint32_t IRR;
  volatile uint32_t IMCR;
        uint32_t RESERVED4[43U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
        uint32_t RESERVED5[6U];
  volatile const uint32_t PID4;
  volatile const uint32_t PID5;
  volatile const uint32_t PID6;
  volatile const uint32_t PID7;
  volatile const uint32_t PID0;
  volatile const uint32_t PID1;
  volatile const uint32_t PID2;
  volatile const uint32_t PID3;
  volatile const uint32_t CID0;
  volatile const uint32_t CID1;
  volatile const uint32_t CID2;
  volatile const uint32_t CID3;
} ITM_Type;
# 914 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t CYCCNT;
  volatile uint32_t CPICNT;
  volatile uint32_t EXCCNT;
  volatile uint32_t SLEEPCNT;
  volatile uint32_t LSUCNT;
  volatile uint32_t FOLDCNT;
  volatile const uint32_t PCSR;
  volatile uint32_t COMP0;
  volatile uint32_t MASK0;
  volatile uint32_t FUNCTION0;
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;
  volatile uint32_t MASK1;
  volatile uint32_t FUNCTION1;
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;
  volatile uint32_t MASK2;
  volatile uint32_t FUNCTION2;
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;
  volatile uint32_t MASK3;
  volatile uint32_t FUNCTION3;
} DWT_Type;
# 1061 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
  volatile const uint32_t SSPSR;
  volatile uint32_t CSPSR;
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;
        uint32_t RESERVED2[131U];
  volatile const uint32_t FFSR;
  volatile uint32_t FFCR;
  volatile const uint32_t FSCR;
        uint32_t RESERVED3[759U];
  volatile const uint32_t TRIGGER;
  volatile const uint32_t FIFO0;
  volatile const uint32_t ITATBCTR2;
        uint32_t RESERVED4[1U];
  volatile const uint32_t ITATBCTR0;
  volatile const uint32_t FIFO1;
  volatile uint32_t ITCTRL;
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;
  volatile uint32_t CLAIMCLR;
        uint32_t RESERVED7[8U];
  volatile const uint32_t DEVID;
  volatile const uint32_t DEVTYPE;
} TPI_Type;
# 1223 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
  volatile const uint32_t TYPE;
  volatile uint32_t CTRL;
  volatile uint32_t RNR;
  volatile uint32_t RBAR;
  volatile uint32_t RASR;
  volatile uint32_t RBAR_A1;
  volatile uint32_t RASR_A1;
  volatile uint32_t RBAR_A2;
  volatile uint32_t RASR_A2;
  volatile uint32_t RBAR_A3;
  volatile uint32_t RASR_A3;
} MPU_Type;
# 1319 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile uint32_t FPCCR;
  volatile uint32_t FPCAR;
  volatile uint32_t FPDSCR;
  volatile const uint32_t MVFR0;
  volatile const uint32_t MVFR1;
} FPU_Type;
# 1425 "../Drivers/CMSIS/Include\\core_cm4.h" 3
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
} CoreDebug_Type;
# 1657 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline void __NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);

  reg_value = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));
  reg_value = (reg_value |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U) );
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = reg_value;
}







static __inline uint32_t __NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}
# 1688 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1705 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1724 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
  }
}
# 1743 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1762 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1777 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1794 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1816 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] = (uint8_t)((priority << (8U - 4U)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 4U)) & (uint32_t)0xFFUL);
  }
}
# 1838 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] >> (8U - 4U)));
  }
  else
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[(((uint32_t)IRQn) & 0xFUL)-4UL] >> (8U - 4U)));
  }
}
# 1863 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4U)) ? (uint32_t)(4U) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4U));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
         );
}
# 1890 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4U)) ? (uint32_t)(4U) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4U)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4U));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
}
# 1913 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  vectors[(int32_t)IRQn + 16] = vector;
}
# 1928 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  return vectors[(int32_t)IRQn + 16];
}






__attribute__((__noreturn__)) static __inline void __NVIC_SystemReset(void)
{
  __builtin_arm_dsb(0xF);;

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = (uint32_t)((0x5FAUL << 16U) |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U) );
  __builtin_arm_dsb(0xF);;

  for(;;)
  {
    __builtin_arm_nop();
  }
}







# 1 "../Drivers/CMSIS/Include/mpu_armv7.h" 1 3
# 29 "../Drivers/CMSIS/Include/mpu_armv7.h" 3
# 180 "../Drivers/CMSIS/Include/mpu_armv7.h" 3
typedef struct {
  uint32_t RBAR;
  uint32_t RASR;
} ARM_MPU_Region_t;




static __inline void ARM_MPU_Enable(uint32_t MPU_Control)
{
  __builtin_arm_dsb(0xF);;
  __builtin_arm_isb(0xF);;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL = MPU_Control | (1UL );

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR |= (1UL << 16U);

}



static __inline void ARM_MPU_Disable(void)
{
  __builtin_arm_dsb(0xF);;
  __builtin_arm_isb(0xF);;

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR &= ~(1UL << 16U);

  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL &= ~(1UL );
}




static __inline void ARM_MPU_ClrRegion(uint32_t rnr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = 0U;
}





static __inline void ARM_MPU_SetRegion(uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void ARM_MPU_SetRegionEx(uint32_t rnr, uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void orderedCpy(volatile uint32_t* dst, const uint32_t* __restrict src, uint32_t len)
{
  uint32_t i;
  for (i = 0U; i < len; ++i)
  {
    dst[i] = src[i];
  }
}





static __inline void ARM_MPU_Load(ARM_MPU_Region_t const* table, uint32_t cnt)
{
  const uint32_t rowWordSize = sizeof(ARM_MPU_Region_t)/4U;
  while (cnt > 4U) {
    orderedCpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), 4U*rowWordSize);
    table += 4U;
    cnt -= 4U;
  }
  orderedCpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), cnt*rowWordSize);
}
# 1961 "../Drivers/CMSIS/Include\\core_cm4.h" 2 3
# 1981 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline uint32_t SCB_GetFPUType(void)
{
  uint32_t mvfr0;

  mvfr0 = ((FPU_Type *) ((0xE000E000UL) + 0x0F30UL) )->MVFR0;
  if ((mvfr0 & ((0xFUL << 4U) | (0xFUL << 8U))) == 0x020U)
  {
    return 1U;
  }
  else
  {
    return 0U;
  }
}
# 2022 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 4U) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 2052 "../Drivers/CMSIS/Include\\core_cm4.h" 3
extern volatile int32_t ITM_RxBuffer;
# 2064 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL ) != 0UL) )
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __builtin_arm_nop();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}
# 2085 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;

  if (ITM_RxBuffer != ((int32_t)0x5AA55AA5U))
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = ((int32_t)0x5AA55AA5U);
  }

  return (ch);
}
# 2105 "../Drivers/CMSIS/Include\\core_cm4.h" 3
static __inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == ((int32_t)0x5AA55AA5U))
  {
    return (0);
  }
  else
  {
    return (1);
  }
}
# 167 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h" 2
# 1 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/system_stm32f4xx.h" 1
# 57 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/system_stm32f4xx.h"
extern uint32_t SystemCoreClock;

extern const uint8_t AHBPrescTable[16];
extern const uint8_t APBPrescTable[8];
# 86 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/system_stm32f4xx.h"
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);
# 168 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h" 2
# 178 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h"
typedef struct
{
  volatile uint32_t SR;
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMPR1;
  volatile uint32_t SMPR2;
  volatile uint32_t JOFR1;
  volatile uint32_t JOFR2;
  volatile uint32_t JOFR3;
  volatile uint32_t JOFR4;
  volatile uint32_t HTR;
  volatile uint32_t LTR;
  volatile uint32_t SQR1;
  volatile uint32_t SQR2;
  volatile uint32_t SQR3;
  volatile uint32_t JSQR;
  volatile uint32_t JDR1;
  volatile uint32_t JDR2;
  volatile uint32_t JDR3;
  volatile uint32_t JDR4;
  volatile uint32_t DR;
} ADC_TypeDef;

typedef struct
{
  volatile uint32_t CSR;
  volatile uint32_t CCR;
  volatile uint32_t CDR;

} ADC_Common_TypeDef;






typedef struct
{
  volatile uint32_t TIR;
  volatile uint32_t TDTR;
  volatile uint32_t TDLR;
  volatile uint32_t TDHR;
} CAN_TxMailBox_TypeDef;





typedef struct
{
  volatile uint32_t RIR;
  volatile uint32_t RDTR;
  volatile uint32_t RDLR;
  volatile uint32_t RDHR;
} CAN_FIFOMailBox_TypeDef;





typedef struct
{
  volatile uint32_t FR1;
  volatile uint32_t FR2;
} CAN_FilterRegister_TypeDef;





typedef struct
{
  volatile uint32_t MCR;
  volatile uint32_t MSR;
  volatile uint32_t TSR;
  volatile uint32_t RF0R;
  volatile uint32_t RF1R;
  volatile uint32_t IER;
  volatile uint32_t ESR;
  volatile uint32_t BTR;
  uint32_t RESERVED0[88];
  CAN_TxMailBox_TypeDef sTxMailBox[3];
  CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
  uint32_t RESERVED1[12];
  volatile uint32_t FMR;
  volatile uint32_t FM1R;
  uint32_t RESERVED2;
  volatile uint32_t FS1R;
  uint32_t RESERVED3;
  volatile uint32_t FFA1R;
  uint32_t RESERVED4;
  volatile uint32_t FA1R;
  uint32_t RESERVED5[8];
  CAN_FilterRegister_TypeDef sFilterRegister[28];
} CAN_TypeDef;





typedef struct
{
  volatile uint32_t DR;
  volatile uint8_t IDR;
  uint8_t RESERVED0;
  uint16_t RESERVED1;
  volatile uint32_t CR;
} CRC_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SWTRIGR;
  volatile uint32_t DHR12R1;
  volatile uint32_t DHR12L1;
  volatile uint32_t DHR8R1;
  volatile uint32_t DHR12R2;
  volatile uint32_t DHR12L2;
  volatile uint32_t DHR8R2;
  volatile uint32_t DHR12RD;
  volatile uint32_t DHR12LD;
  volatile uint32_t DHR8RD;
  volatile uint32_t DOR1;
  volatile uint32_t DOR2;
  volatile uint32_t SR;
} DAC_TypeDef;





typedef struct
{
  volatile uint32_t IDCODE;
  volatile uint32_t CR;
  volatile uint32_t APB1FZ;
  volatile uint32_t APB2FZ;
}DBGMCU_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SR;
  volatile uint32_t RISR;
  volatile uint32_t IER;
  volatile uint32_t MISR;
  volatile uint32_t ICR;
  volatile uint32_t ESCR;
  volatile uint32_t ESUR;
  volatile uint32_t CWSTRTR;
  volatile uint32_t CWSIZER;
  volatile uint32_t DR;
} DCMI_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t NDTR;
  volatile uint32_t PAR;
  volatile uint32_t M0AR;
  volatile uint32_t M1AR;
  volatile uint32_t FCR;
} DMA_Stream_TypeDef;

typedef struct
{
  volatile uint32_t LISR;
  volatile uint32_t HISR;
  volatile uint32_t LIFCR;
  volatile uint32_t HIFCR;
} DMA_TypeDef;





typedef struct
{
  volatile uint32_t MACCR;
  volatile uint32_t MACFFR;
  volatile uint32_t MACHTHR;
  volatile uint32_t MACHTLR;
  volatile uint32_t MACMIIAR;
  volatile uint32_t MACMIIDR;
  volatile uint32_t MACFCR;
  volatile uint32_t MACVLANTR;
  uint32_t RESERVED0[2];
  volatile uint32_t MACRWUFFR;
  volatile uint32_t MACPMTCSR;
  uint32_t RESERVED1;
  volatile uint32_t MACDBGR;
  volatile uint32_t MACSR;
  volatile uint32_t MACIMR;
  volatile uint32_t MACA0HR;
  volatile uint32_t MACA0LR;
  volatile uint32_t MACA1HR;
  volatile uint32_t MACA1LR;
  volatile uint32_t MACA2HR;
  volatile uint32_t MACA2LR;
  volatile uint32_t MACA3HR;
  volatile uint32_t MACA3LR;
  uint32_t RESERVED2[40];
  volatile uint32_t MMCCR;
  volatile uint32_t MMCRIR;
  volatile uint32_t MMCTIR;
  volatile uint32_t MMCRIMR;
  volatile uint32_t MMCTIMR;
  uint32_t RESERVED3[14];
  volatile uint32_t MMCTGFSCCR;
  volatile uint32_t MMCTGFMSCCR;
  uint32_t RESERVED4[5];
  volatile uint32_t MMCTGFCR;
  uint32_t RESERVED5[10];
  volatile uint32_t MMCRFCECR;
  volatile uint32_t MMCRFAECR;
  uint32_t RESERVED6[10];
  volatile uint32_t MMCRGUFCR;
  uint32_t RESERVED7[334];
  volatile uint32_t PTPTSCR;
  volatile uint32_t PTPSSIR;
  volatile uint32_t PTPTSHR;
  volatile uint32_t PTPTSLR;
  volatile uint32_t PTPTSHUR;
  volatile uint32_t PTPTSLUR;
  volatile uint32_t PTPTSAR;
  volatile uint32_t PTPTTHR;
  volatile uint32_t PTPTTLR;
  volatile uint32_t RESERVED8;
  volatile uint32_t PTPTSSR;
  uint32_t RESERVED9[565];
  volatile uint32_t DMABMR;
  volatile uint32_t DMATPDR;
  volatile uint32_t DMARPDR;
  volatile uint32_t DMARDLAR;
  volatile uint32_t DMATDLAR;
  volatile uint32_t DMASR;
  volatile uint32_t DMAOMR;
  volatile uint32_t DMAIER;
  volatile uint32_t DMAMFBOCR;
  volatile uint32_t DMARSWTR;
  uint32_t RESERVED10[8];
  volatile uint32_t DMACHTDR;
  volatile uint32_t DMACHRDR;
  volatile uint32_t DMACHTBAR;
  volatile uint32_t DMACHRBAR;
} ETH_TypeDef;





typedef struct
{
  volatile uint32_t IMR;
  volatile uint32_t EMR;
  volatile uint32_t RTSR;
  volatile uint32_t FTSR;
  volatile uint32_t SWIER;
  volatile uint32_t PR;
} EXTI_TypeDef;





typedef struct
{
  volatile uint32_t ACR;
  volatile uint32_t KEYR;
  volatile uint32_t OPTKEYR;
  volatile uint32_t SR;
  volatile uint32_t CR;
  volatile uint32_t OPTCR;
  volatile uint32_t OPTCR1;
} FLASH_TypeDef;







typedef struct
{
  volatile uint32_t BTCR[8];
} FSMC_Bank1_TypeDef;





typedef struct
{
  volatile uint32_t BWTR[7];
} FSMC_Bank1E_TypeDef;





typedef struct
{
  volatile uint32_t PCR2;
  volatile uint32_t SR2;
  volatile uint32_t PMEM2;
  volatile uint32_t PATT2;
  uint32_t RESERVED0;
  volatile uint32_t ECCR2;
  uint32_t RESERVED1;
  uint32_t RESERVED2;
  volatile uint32_t PCR3;
  volatile uint32_t SR3;
  volatile uint32_t PMEM3;
  volatile uint32_t PATT3;
  uint32_t RESERVED3;
  volatile uint32_t ECCR3;
} FSMC_Bank2_3_TypeDef;





typedef struct
{
  volatile uint32_t PCR4;
  volatile uint32_t SR4;
  volatile uint32_t PMEM4;
  volatile uint32_t PATT4;
  volatile uint32_t PIO4;
} FSMC_Bank4_TypeDef;





typedef struct
{
  volatile uint32_t MODER;
  volatile uint32_t OTYPER;
  volatile uint32_t OSPEEDR;
  volatile uint32_t PUPDR;
  volatile uint32_t IDR;
  volatile uint32_t ODR;
  volatile uint32_t BSRR;
  volatile uint32_t LCKR;
  volatile uint32_t AFR[2];
} GPIO_TypeDef;





typedef struct
{
  volatile uint32_t MEMRMP;
  volatile uint32_t PMC;
  volatile uint32_t EXTICR[4];
  uint32_t RESERVED[2];
  volatile uint32_t CMPCR;
} SYSCFG_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t OAR1;
  volatile uint32_t OAR2;
  volatile uint32_t DR;
  volatile uint32_t SR1;
  volatile uint32_t SR2;
  volatile uint32_t CCR;
  volatile uint32_t TRISE;
} I2C_TypeDef;





typedef struct
{
  volatile uint32_t KR;
  volatile uint32_t PR;
  volatile uint32_t RLR;
  volatile uint32_t SR;
} IWDG_TypeDef;






typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CSR;
} PWR_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t PLLCFGR;
  volatile uint32_t CFGR;
  volatile uint32_t CIR;
  volatile uint32_t AHB1RSTR;
  volatile uint32_t AHB2RSTR;
  volatile uint32_t AHB3RSTR;
  uint32_t RESERVED0;
  volatile uint32_t APB1RSTR;
  volatile uint32_t APB2RSTR;
  uint32_t RESERVED1[2];
  volatile uint32_t AHB1ENR;
  volatile uint32_t AHB2ENR;
  volatile uint32_t AHB3ENR;
  uint32_t RESERVED2;
  volatile uint32_t APB1ENR;
  volatile uint32_t APB2ENR;
  uint32_t RESERVED3[2];
  volatile uint32_t AHB1LPENR;
  volatile uint32_t AHB2LPENR;
  volatile uint32_t AHB3LPENR;
  uint32_t RESERVED4;
  volatile uint32_t APB1LPENR;
  volatile uint32_t APB2LPENR;
  uint32_t RESERVED5[2];
  volatile uint32_t BDCR;
  volatile uint32_t CSR;
  uint32_t RESERVED6[2];
  volatile uint32_t SSCGR;
  volatile uint32_t PLLI2SCFGR;
} RCC_TypeDef;





typedef struct
{
  volatile uint32_t TR;
  volatile uint32_t DR;
  volatile uint32_t CR;
  volatile uint32_t ISR;
  volatile uint32_t PRER;
  volatile uint32_t WUTR;
  volatile uint32_t CALIBR;
  volatile uint32_t ALRMAR;
  volatile uint32_t ALRMBR;
  volatile uint32_t WPR;
  volatile uint32_t SSR;
  volatile uint32_t SHIFTR;
  volatile uint32_t TSTR;
  volatile uint32_t TSDR;
  volatile uint32_t TSSSR;
  volatile uint32_t CALR;
  volatile uint32_t TAFCR;
  volatile uint32_t ALRMASSR;
  volatile uint32_t ALRMBSSR;
  uint32_t RESERVED7;
  volatile uint32_t BKP0R;
  volatile uint32_t BKP1R;
  volatile uint32_t BKP2R;
  volatile uint32_t BKP3R;
  volatile uint32_t BKP4R;
  volatile uint32_t BKP5R;
  volatile uint32_t BKP6R;
  volatile uint32_t BKP7R;
  volatile uint32_t BKP8R;
  volatile uint32_t BKP9R;
  volatile uint32_t BKP10R;
  volatile uint32_t BKP11R;
  volatile uint32_t BKP12R;
  volatile uint32_t BKP13R;
  volatile uint32_t BKP14R;
  volatile uint32_t BKP15R;
  volatile uint32_t BKP16R;
  volatile uint32_t BKP17R;
  volatile uint32_t BKP18R;
  volatile uint32_t BKP19R;
} RTC_TypeDef;





typedef struct
{
  volatile uint32_t POWER;
  volatile uint32_t CLKCR;
  volatile uint32_t ARG;
  volatile uint32_t CMD;
  volatile const uint32_t RESPCMD;
  volatile const uint32_t RESP1;
  volatile const uint32_t RESP2;
  volatile const uint32_t RESP3;
  volatile const uint32_t RESP4;
  volatile uint32_t DTIMER;
  volatile uint32_t DLEN;
  volatile uint32_t DCTRL;
  volatile const uint32_t DCOUNT;
  volatile const uint32_t STA;
  volatile uint32_t ICR;
  volatile uint32_t MASK;
  uint32_t RESERVED0[2];
  volatile const uint32_t FIFOCNT;
  uint32_t RESERVED1[13];
  volatile uint32_t FIFO;
} SDIO_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SR;
  volatile uint32_t DR;
  volatile uint32_t CRCPR;
  volatile uint32_t RXCRCR;
  volatile uint32_t TXCRCR;
  volatile uint32_t I2SCFGR;
  volatile uint32_t I2SPR;
} SPI_TypeDef;






typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMCR;
  volatile uint32_t DIER;
  volatile uint32_t SR;
  volatile uint32_t EGR;
  volatile uint32_t CCMR1;
  volatile uint32_t CCMR2;
  volatile uint32_t CCER;
  volatile uint32_t CNT;
  volatile uint32_t PSC;
  volatile uint32_t ARR;
  volatile uint32_t RCR;
  volatile uint32_t CCR1;
  volatile uint32_t CCR2;
  volatile uint32_t CCR3;
  volatile uint32_t CCR4;
  volatile uint32_t BDTR;
  volatile uint32_t DCR;
  volatile uint32_t DMAR;
  volatile uint32_t OR;
} TIM_TypeDef;





typedef struct
{
  volatile uint32_t SR;
  volatile uint32_t DR;
  volatile uint32_t BRR;
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t CR3;
  volatile uint32_t GTPR;
} USART_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFR;
  volatile uint32_t SR;
} WWDG_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SR;
  volatile uint32_t DR;
} RNG_TypeDef;




typedef struct
{
  volatile uint32_t GOTGCTL;
  volatile uint32_t GOTGINT;
  volatile uint32_t GAHBCFG;
  volatile uint32_t GUSBCFG;
  volatile uint32_t GRSTCTL;
  volatile uint32_t GINTSTS;
  volatile uint32_t GINTMSK;
  volatile uint32_t GRXSTSR;
  volatile uint32_t GRXSTSP;
  volatile uint32_t GRXFSIZ;
  volatile uint32_t DIEPTXF0_HNPTXFSIZ;
  volatile uint32_t HNPTXSTS;
  uint32_t Reserved30[2];
  volatile uint32_t GCCFG;
  volatile uint32_t CID;
  uint32_t Reserved40[48];
  volatile uint32_t HPTXFSIZ;
  volatile uint32_t DIEPTXF[0x0F];
} USB_OTG_GlobalTypeDef;




typedef struct
{
  volatile uint32_t DCFG;
  volatile uint32_t DCTL;
  volatile uint32_t DSTS;
  uint32_t Reserved0C;
  volatile uint32_t DIEPMSK;
  volatile uint32_t DOEPMSK;
  volatile uint32_t DAINT;
  volatile uint32_t DAINTMSK;
  uint32_t Reserved20;
  uint32_t Reserved9;
  volatile uint32_t DVBUSDIS;
  volatile uint32_t DVBUSPULSE;
  volatile uint32_t DTHRCTL;
  volatile uint32_t DIEPEMPMSK;
  volatile uint32_t DEACHINT;
  volatile uint32_t DEACHMSK;
  uint32_t Reserved40;
  volatile uint32_t DINEP1MSK;
  uint32_t Reserved44[15];
  volatile uint32_t DOUTEP1MSK;
} USB_OTG_DeviceTypeDef;




typedef struct
{
  volatile uint32_t DIEPCTL;
  uint32_t Reserved04;
  volatile uint32_t DIEPINT;
  uint32_t Reserved0C;
  volatile uint32_t DIEPTSIZ;
  volatile uint32_t DIEPDMA;
  volatile uint32_t DTXFSTS;
  uint32_t Reserved18;
} USB_OTG_INEndpointTypeDef;




typedef struct
{
  volatile uint32_t DOEPCTL;
  uint32_t Reserved04;
  volatile uint32_t DOEPINT;
  uint32_t Reserved0C;
  volatile uint32_t DOEPTSIZ;
  volatile uint32_t DOEPDMA;
  uint32_t Reserved18[2];
} USB_OTG_OUTEndpointTypeDef;




typedef struct
{
  volatile uint32_t HCFG;
  volatile uint32_t HFIR;
  volatile uint32_t HFNUM;
  uint32_t Reserved40C;
  volatile uint32_t HPTXSTS;
  volatile uint32_t HAINT;
  volatile uint32_t HAINTMSK;
} USB_OTG_HostTypeDef;




typedef struct
{
  volatile uint32_t HCCHAR;
  volatile uint32_t HCSPLT;
  volatile uint32_t HCINT;
  volatile uint32_t HCINTMSK;
  volatile uint32_t HCTSIZ;
  volatile uint32_t HCDMA;
  uint32_t Reserved[2];
} USB_OTG_HostChannelTypeDef;
# 133 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include\\stm32f4xx.h" 2
# 184 "../Drivers/CMSIS/Device/ST/STM32F4xx/Include\\stm32f4xx.h"
typedef enum
{
  RESET = 0U,
  SET = !RESET
} FlagStatus, ITStatus;

typedef enum
{
  DISABLE = 0U,
  ENABLE = !DISABLE
} FunctionalState;


typedef enum
{
  SUCCESS = 0U,
  ERROR = !SUCCESS
} ErrorStatus;
# 29 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h" 2
# 46 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static const uint8_t STREAM_OFFSET_TAB[] =
{
  (uint8_t)((((0x40000000UL + 0x00020000UL) + 0x6000UL) + 0x010UL) - ((0x40000000UL + 0x00020000UL) + 0x6000UL)),
  (uint8_t)((((0x40000000UL + 0x00020000UL) + 0x6000UL) + 0x028UL) - ((0x40000000UL + 0x00020000UL) + 0x6000UL)),
  (uint8_t)((((0x40000000UL + 0x00020000UL) + 0x6000UL) + 0x040UL) - ((0x40000000UL + 0x00020000UL) + 0x6000UL)),
  (uint8_t)((((0x40000000UL + 0x00020000UL) + 0x6000UL) + 0x058UL) - ((0x40000000UL + 0x00020000UL) + 0x6000UL)),
  (uint8_t)((((0x40000000UL + 0x00020000UL) + 0x6000UL) + 0x070UL) - ((0x40000000UL + 0x00020000UL) + 0x6000UL)),
  (uint8_t)((((0x40000000UL + 0x00020000UL) + 0x6000UL) + 0x088UL) - ((0x40000000UL + 0x00020000UL) + 0x6000UL)),
  (uint8_t)((((0x40000000UL + 0x00020000UL) + 0x6000UL) + 0x0A0UL) - ((0x40000000UL + 0x00020000UL) + 0x6000UL)),
  (uint8_t)((((0x40000000UL + 0x00020000UL) + 0x6000UL) + 0x0B8UL) - ((0x40000000UL + 0x00020000UL) + 0x6000UL))
};
# 77 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
typedef struct
{
  uint32_t PeriphOrM2MSrcAddress;




  uint32_t MemoryOrM2MDstAddress;




  uint32_t Direction;





  uint32_t Mode;






  uint32_t PeriphOrM2MSrcIncMode;





  uint32_t MemoryOrM2MDstIncMode;





  uint32_t PeriphOrM2MSrcDataSize;





  uint32_t MemoryOrM2MDstDataSize;





  uint32_t NbData;






  uint32_t Channel;




  uint32_t Priority;




  uint32_t FIFOMode;






  uint32_t FIFOThreshold;




  uint32_t MemBurst;







  uint32_t PeriphBurst;







} LL_DMA_InitTypeDef;
# 494 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_EnableStream(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) |= ((0x1UL << (0U))));
}
# 514 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_DisableStream(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) &= ~((0x1UL << (0U))));
}
# 534 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_IsEnabledStream(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (0U)))) == ((0x1UL << (0U))));
}
# 569 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_ConfigTransfer(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Configuration)
{
  (((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x3UL << (6U)) | (0x1UL << (8U)) | (0x1UL << (9U)) | (0x1UL << (10U)) | (0x3UL << (11U)) | (0x3UL << (13U)) | (0x3UL << (16U)) | (0x1UL << (5U))))) | (Configuration))));


}
# 595 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetDataTransferDirection(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Direction)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x3UL << (6U))))) | (Direction))));
}
# 618 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetDataTransferDirection(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x3UL << (6U)))));
}
# 643 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetMode(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Mode)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x1UL << (8U)) | (0x1UL << (5U))))) | (Mode))));
}
# 667 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetMode(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (8U)) | (0x1UL << (5U)))));
}
# 690 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetPeriphIncMode(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t IncrementMode)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x1UL << (9U))))) | (IncrementMode))));
}
# 712 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetPeriphIncMode(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (9U)))));
}
# 735 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetMemoryIncMode(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t IncrementMode)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x1UL << (10U))))) | (IncrementMode))));
}
# 757 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetMemoryIncMode(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (10U)))));
}
# 781 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetPeriphSize(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Size)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x3UL << (11U))))) | (Size))));
}
# 804 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetPeriphSize(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x3UL << (11U)))));
}
# 828 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetMemorySize(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Size)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x3UL << (13U))))) | (Size))));
}
# 851 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetMemorySize(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x3UL << (13U)))));
}
# 874 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetIncOffsetSize(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t OffsetSize)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x1UL << (15U))))) | (OffsetSize))));
}
# 896 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetIncOffsetSize(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (15U)))));
}
# 921 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetStreamPriorityLevel(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Priority)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x3UL << (16U))))) | (Priority))));
}
# 945 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetStreamPriorityLevel(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x3UL << (16U)))));
}
# 968 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetDataLength(DMA_TypeDef* DMAx, uint32_t Stream, uint32_t NbData)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->NDTR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->NDTR))) & (~((0xFFFFUL << (0U))))) | (NbData))));
}
# 990 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetDataLength(DMA_TypeDef* DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->NDTR) & ((0xFFFFUL << (0U)))));
}
# 1019 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetChannelSelection(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Channel)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x7UL << (25U))))) | (Channel))));
}
# 1047 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetChannelSelection(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x7UL << (25U)))));
}
# 1072 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetMemoryBurstxfer(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Mburst)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x3UL << (23U))))) | (Mburst))));
}
# 1096 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetMemoryBurstxfer(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x3UL << (23U)))));
}
# 1121 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetPeriphBurstxfer(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Pburst)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x3UL << (21U))))) | (Pburst))));
}
# 1145 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetPeriphBurstxfer(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x3UL << (21U)))));
}
# 1168 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetCurrentTargetMem(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t CurrentMemory)
{
   (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR))) & (~((0x1UL << (19U))))) | (CurrentMemory))));
}
# 1190 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetCurrentTargetMem(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (19U)))));
}
# 1210 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_EnableDoubleBufferMode(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) |= ((0x1UL << (18U))));
}
# 1230 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_DisableDoubleBufferMode(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) &= ~((0x1UL << (18U))));
}
# 1256 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetFIFOStatus(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR) & ((0x7UL << (3U)))));
}
# 1276 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_DisableFifoMode(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR) &= ~((0x1UL << (2U))));
}
# 1296 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_EnableFifoMode(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR) |= ((0x1UL << (2U))));
}
# 1321 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetFIFOThreshold(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Threshold)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR))) & (~((0x3UL << (0U))))) | (Threshold))));
}
# 1345 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetFIFOThreshold(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR) & ((0x3UL << (0U)))));
}
# 1374 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_ConfigFifo(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t FifoMode, uint32_t FifoThreshold)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR))) & (~((0x3UL << (0U))|(0x1UL << (2U))))) | (FifoMode|FifoThreshold))));
}
# 1402 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_ConfigAddresses(DMA_TypeDef* DMAx, uint32_t Stream, uint32_t SrcAddress, uint32_t DstAddress, uint32_t Direction)
{

  if (Direction == (0x1UL << (6U)))
  {
    ((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->M0AR) = (SrcAddress));
    ((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->PAR) = (DstAddress));
  }

  else
  {
    ((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->PAR) = (SrcAddress));
    ((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->M0AR) = (DstAddress));
  }
}
# 1436 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetMemoryAddress(DMA_TypeDef* DMAx, uint32_t Stream, uint32_t MemoryAddress)
{
  ((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->M0AR) = (MemoryAddress));
}
# 1459 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetPeriphAddress(DMA_TypeDef* DMAx, uint32_t Stream, uint32_t PeriphAddress)
{
  ((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->PAR) = (PeriphAddress));
}
# 1480 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetMemoryAddress(DMA_TypeDef* DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->M0AR)));
}
# 1501 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetPeriphAddress(DMA_TypeDef* DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->PAR)));
}
# 1524 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetM2MSrcAddress(DMA_TypeDef* DMAx, uint32_t Stream, uint32_t MemoryAddress)
{
  ((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->PAR) = (MemoryAddress));
}
# 1547 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetM2MDstAddress(DMA_TypeDef* DMAx, uint32_t Stream, uint32_t MemoryAddress)
  {
    ((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->M0AR) = (MemoryAddress));
  }
# 1568 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetM2MSrcAddress(DMA_TypeDef* DMAx, uint32_t Stream)
  {
   return (((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->PAR)));
  }
# 1589 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetM2MDstAddress(DMA_TypeDef* DMAx, uint32_t Stream)
{
 return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->M0AR)));
}
# 1610 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_SetMemory1Address(DMA_TypeDef *DMAx, uint32_t Stream, uint32_t Address)
{
  (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->M1AR)) = ((((((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->M1AR))) & (~((0xFFFFFFFFUL << (0U))))) | (Address))));
}
# 1630 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_GetMemory1Address(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->M1AR);
}
# 1649 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_IsActiveFlag_HT0(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (4U))))==((0x1UL << (4U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_HT1(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (10U))))==((0x1UL << (10U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_HT2(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (20U))))==((0x1UL << (20U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_HT3(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (26U))))==((0x1UL << (26U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_HT4(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (4U))))==((0x1UL << (4U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_HT5(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (10U))))==((0x1UL << (10U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_HT6(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (20U))))==((0x1UL << (20U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_HT7(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (26U))))==((0x1UL << (26U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TC0(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (5U))))==((0x1UL << (5U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TC1(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (11U))))==((0x1UL << (11U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TC2(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (21U))))==((0x1UL << (21U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TC3(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (27U))))==((0x1UL << (27U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TC4(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (5U))))==((0x1UL << (5U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TC5(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (11U))))==((0x1UL << (11U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TC6(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (21U))))==((0x1UL << (21U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TC7(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (27U))))==((0x1UL << (27U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TE0(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (3U))))==((0x1UL << (3U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TE1(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (9U))))==((0x1UL << (9U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TE2(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (19U))))==((0x1UL << (19U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TE3(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (25U))))==((0x1UL << (25U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TE4(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (3U))))==((0x1UL << (3U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TE5(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (9U))))==((0x1UL << (9U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TE6(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (19U))))==((0x1UL << (19U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_TE7(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (25U))))==((0x1UL << (25U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_DME0(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (2U))))==((0x1UL << (2U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_DME1(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (8U))))==((0x1UL << (8U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_DME2(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (18U))))==((0x1UL << (18U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_DME3(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (24U))))==((0x1UL << (24U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_DME4(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (2U))))==((0x1UL << (2U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_DME5(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (8U))))==((0x1UL << (8U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_DME6(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (18U))))==((0x1UL << (18U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_DME7(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (24U))))==((0x1UL << (24U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_FE0(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (0U))))==((0x1UL << (0U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_FE1(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (6U))))==((0x1UL << (6U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_FE2(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (16U))))==((0x1UL << (16U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_FE3(DMA_TypeDef *DMAx)
{
  return (((DMAx->LISR) & ((0x1UL << (22U))))==((0x1UL << (22U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_FE4(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (0U))))==((0x1UL << (0U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_FE5(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (6U))))==((0x1UL << (6U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_FE6(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (16U))))==((0x1UL << (16U))));
}







static __inline uint32_t LL_DMA_IsActiveFlag_FE7(DMA_TypeDef *DMAx)
{
  return (((DMAx->HISR) & ((0x1UL << (22U))))==((0x1UL << (22U))));
}







static __inline void LL_DMA_ClearFlag_HT0(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (4U))));
}







static __inline void LL_DMA_ClearFlag_HT1(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (10U))));
}







static __inline void LL_DMA_ClearFlag_HT2(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (20U))));
}







static __inline void LL_DMA_ClearFlag_HT3(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (26U))));
}







static __inline void LL_DMA_ClearFlag_HT4(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (4U))));
}







static __inline void LL_DMA_ClearFlag_HT5(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (10U))));
}







static __inline void LL_DMA_ClearFlag_HT6(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (20U))));
}







static __inline void LL_DMA_ClearFlag_HT7(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (26U))));
}







static __inline void LL_DMA_ClearFlag_TC0(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (5U))));
}







static __inline void LL_DMA_ClearFlag_TC1(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (11U))));
}







static __inline void LL_DMA_ClearFlag_TC2(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (21U))));
}







static __inline void LL_DMA_ClearFlag_TC3(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (27U))));
}







static __inline void LL_DMA_ClearFlag_TC4(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (5U))));
}







static __inline void LL_DMA_ClearFlag_TC5(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (11U))));
}







static __inline void LL_DMA_ClearFlag_TC6(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (21U))));
}







static __inline void LL_DMA_ClearFlag_TC7(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (27U))));
}







static __inline void LL_DMA_ClearFlag_TE0(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (3U))));
}







static __inline void LL_DMA_ClearFlag_TE1(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (9U))));
}







static __inline void LL_DMA_ClearFlag_TE2(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (19U))));
}







static __inline void LL_DMA_ClearFlag_TE3(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (25U))));
}







static __inline void LL_DMA_ClearFlag_TE4(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (3U))));
}







static __inline void LL_DMA_ClearFlag_TE5(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (9U))));
}







static __inline void LL_DMA_ClearFlag_TE6(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (19U))));
}







static __inline void LL_DMA_ClearFlag_TE7(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (25U))));
}







static __inline void LL_DMA_ClearFlag_DME0(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (2U))));
}







static __inline void LL_DMA_ClearFlag_DME1(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (8U))));
}







static __inline void LL_DMA_ClearFlag_DME2(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (18U))));
}







static __inline void LL_DMA_ClearFlag_DME3(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (24U))));
}







static __inline void LL_DMA_ClearFlag_DME4(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (2U))));
}







static __inline void LL_DMA_ClearFlag_DME5(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (8U))));
}







static __inline void LL_DMA_ClearFlag_DME6(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (18U))));
}







static __inline void LL_DMA_ClearFlag_DME7(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (24U))));
}







static __inline void LL_DMA_ClearFlag_FE0(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (0U))));
}







static __inline void LL_DMA_ClearFlag_FE1(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (6U))));
}







static __inline void LL_DMA_ClearFlag_FE2(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (16U))));
}







static __inline void LL_DMA_ClearFlag_FE3(DMA_TypeDef *DMAx)
{
  ((DMAx->LIFCR) = ((0x1UL << (22U))));
}







static __inline void LL_DMA_ClearFlag_FE4(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (0U))));
}







static __inline void LL_DMA_ClearFlag_FE5(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (6U))));
}







static __inline void LL_DMA_ClearFlag_FE6(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (16U))));
}







static __inline void LL_DMA_ClearFlag_FE7(DMA_TypeDef *DMAx)
{
  ((DMAx->HIFCR) = ((0x1UL << (22U))));
}
# 2546 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_EnableIT_HT(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) |= ((0x1UL << (3U))));
}
# 2566 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_EnableIT_TE(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) |= ((0x1UL << (2U))));
}
# 2586 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_EnableIT_TC(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) |= ((0x1UL << (4U))));
}
# 2606 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_EnableIT_DME(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) |= ((0x1UL << (1U))));
}
# 2626 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_EnableIT_FE(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR) |= ((0x1UL << (7U))));
}
# 2646 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_DisableIT_HT(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) &= ~((0x1UL << (3U))));
}
# 2666 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_DisableIT_TE(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) &= ~((0x1UL << (2U))));
}
# 2686 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_DisableIT_TC(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) &= ~((0x1UL << (4U))));
}
# 2706 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_DisableIT_DME(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) &= ~((0x1UL << (1U))));
}
# 2726 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline void LL_DMA_DisableIT_FE(DMA_TypeDef *DMAx, uint32_t Stream)
{
  ((((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR) &= ~((0x1UL << (7U))));
}
# 2746 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_IsEnabledIT_HT(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (3U)))) == (0x1UL << (3U)));
}
# 2766 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_IsEnabledIT_TE(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (2U)))) == (0x1UL << (2U)));
}
# 2786 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_IsEnabledIT_TC(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (4U)))) == (0x1UL << (4U)));
}
# 2806 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_IsEnabledIT_DME(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->CR) & ((0x1UL << (1U)))) == (0x1UL << (1U)));
}
# 2826 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
static __inline uint32_t LL_DMA_IsEnabledIT_FE(DMA_TypeDef *DMAx, uint32_t Stream)
{
  return (((((DMA_Stream_TypeDef*)((uint32_t)((uint32_t)DMAx + STREAM_OFFSET_TAB[Stream])))->FCR) & ((0x1UL << (7U)))) == (0x1UL << (7U)));
}
# 2840 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_dma.h"
uint32_t LL_DMA_Init(DMA_TypeDef *DMAx, uint32_t Stream, LL_DMA_InitTypeDef *DMA_InitStruct);
uint32_t LL_DMA_DeInit(DMA_TypeDef *DMAx, uint32_t Stream);
void LL_DMA_StructInit(LL_DMA_InitTypeDef *DMA_InitStruct);
# 32 "../Core/Inc/main.h" 2
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h" 1
# 75 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
typedef struct
{
  uint32_t SYSCLK_Frequency;
  uint32_t HCLK_Frequency;
  uint32_t PCLK1_Frequency;
  uint32_t PCLK2_Frequency;
} LL_RCC_ClocksTypeDef;
# 2919 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_HSE_EnableCSS(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) |= ((0x1UL << (19U))));
}






static __inline void LL_RCC_HSE_EnableBypass(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) |= ((0x1UL << (18U))));
}






static __inline void LL_RCC_HSE_DisableBypass(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) &= ~((0x1UL << (18U))));
}






static __inline void LL_RCC_HSE_Enable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) |= ((0x1UL << (16U))));
}






static __inline void LL_RCC_HSE_Disable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) &= ~((0x1UL << (16U))));
}






static __inline uint32_t LL_RCC_HSE_IsReady(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) & ((0x1UL << (17U)))) == ((0x1UL << (17U))));
}
# 2987 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_HSI_Enable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) |= ((0x1UL << (0U))));
}






static __inline void LL_RCC_HSI_Disable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) &= ~((0x1UL << (0U))));
}






static __inline uint32_t LL_RCC_HSI_IsReady(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) & ((0x1UL << (1U)))) == ((0x1UL << (1U))));
}
# 3019 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_HSI_GetCalibration(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) & ((0xFFUL << (8U)))) >> (8U));
}
# 3033 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_HSI_SetCalibTrimming(uint32_t Value)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR))) & (~((0x1FUL << (3U))))) | (Value << (3U)))));
}






static __inline uint32_t LL_RCC_HSI_GetCalibTrimming(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) & ((0x1FUL << (3U)))) >> (3U));
}
# 3061 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_LSE_Enable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) |= ((0x1UL << (0U))));
}






static __inline void LL_RCC_LSE_Disable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) &= ~((0x1UL << (0U))));
}






static __inline void LL_RCC_LSE_EnableBypass(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) |= ((0x1UL << (2U))));
}






static __inline void LL_RCC_LSE_DisableBypass(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) &= ~((0x1UL << (2U))));
}






static __inline uint32_t LL_RCC_LSE_IsReady(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) & ((0x1UL << (1U)))) == ((0x1UL << (1U))));
}
# 3143 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_LSI_Enable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) |= ((0x1UL << (0U))));
}






static __inline void LL_RCC_LSI_Disable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) &= ~((0x1UL << (0U))));
}






static __inline uint32_t LL_RCC_LSI_IsReady(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) & ((0x1UL << (1U)))) == ((0x1UL << (1U))));
}
# 3188 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_SetSysClkSource(uint32_t Source)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR))) & (~((0x3UL << (0U))))) | (Source))));
}
# 3204 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_GetSysClkSource(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR) & ((0x3UL << (2U)))));
}
# 3224 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_SetAHBPrescaler(uint32_t Prescaler)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR))) & (~((0xFUL << (4U))))) | (Prescaler))));
}
# 3240 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_SetAPB1Prescaler(uint32_t Prescaler)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR))) & (~((0x7UL << (10U))))) | (Prescaler))));
}
# 3256 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_SetAPB2Prescaler(uint32_t Prescaler)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR))) & (~((0x7UL << (13U))))) | (Prescaler))));
}
# 3275 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_GetAHBPrescaler(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR) & ((0xFUL << (4U)))));
}
# 3290 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_GetAPB1Prescaler(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR) & ((0x7UL << (10U)))));
}
# 3305 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_GetAPB2Prescaler(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR) & ((0x7UL << (13U)))));
}
# 3390 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_ConfigMCO(uint32_t MCOxSource, uint32_t MCOxPrescaler)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR))) & (~((MCOxSource & 0xFFFF0000U) | (MCOxPrescaler & 0xFFFF0000U)))) | ((MCOxSource << 16U) | (MCOxPrescaler << 16U)))));
}
# 3594 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_SetI2SClockSource(uint32_t Source)
{

  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR))) & (~((0x1UL << (23U))))) | (Source))));



}
# 3879 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_GetI2SClockSource(uint32_t I2Sx)
{

  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR) & (I2Sx)));



}
# 3984 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_SetRTCClockSource(uint32_t Source)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR))) & (~((0x3UL << (8U))))) | (Source))));
}
# 3998 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_GetRTCClockSource(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) & ((0x3UL << (8U)))));
}






static __inline void LL_RCC_EnableRTC(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) |= ((0x1UL << (15U))));
}






static __inline void LL_RCC_DisableRTC(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) &= ~((0x1UL << (15U))));
}






static __inline uint32_t LL_RCC_IsEnabledRTC(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) & ((0x1UL << (15U)))) == ((0x1UL << (15U))));
}






static __inline void LL_RCC_ForceBackupDomainReset(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) |= ((0x1UL << (16U))));
}






static __inline void LL_RCC_ReleaseBackupDomainReset(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->BDCR) &= ~((0x1UL << (16U))));
}
# 4090 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_SetRTC_HSEPrescaler(uint32_t Prescaler)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR))) & (~((0x1FUL << (16U))))) | (Prescaler))));
}
# 4131 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_GetRTC_HSEPrescaler(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CFGR) & ((0x1FUL << (16U)))));
}
# 4184 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_PLL_Enable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) |= ((0x1UL << (24U))));
}







static __inline void LL_RCC_PLL_Disable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) &= ~((0x1UL << (24U))));
}






static __inline uint32_t LL_RCC_PLL_IsReady(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) & ((0x1UL << (25U)))) == ((0x1UL << (25U))));
}
# 4304 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_PLL_ConfigDomain_SYS(uint32_t Source, uint32_t PLLM, uint32_t PLLN, uint32_t PLLP_R)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR))) & (~((0x1UL << (22U)) | (0x3FUL << (0U)) | (0x1FFUL << (6U))))) | (Source | PLLM | PLLN << (6U)))));

  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR))) & (~((0x3UL << (16U))))) | (PLLP_R))));



}
# 4410 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_PLL_ConfigDomain_48M(uint32_t Source, uint32_t PLLM, uint32_t PLLN, uint32_t PLLQ)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR))) & (~((0x1UL << (22U)) | (0x3FUL << (0U)) | (0x1FFUL << (6U)) | (0xFUL << (24U))))) | (Source | PLLM | PLLN << (6U) | PLLQ))));

}
# 4844 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_PLL_SetMainSource(uint32_t PLLSource)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR))) & (~((0x1UL << (22U))))) | (PLLSource))));
}
# 4856 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLL_GetMainSource(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR) & ((0x1UL << (22U)))));
}
# 4868 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLL_GetN(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR) & ((0x1FFUL << (6U)))) >> (6U));
}
# 4882 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLL_GetP(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR) & ((0x3UL << (16U)))));
}
# 4907 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLL_GetQ(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR) & ((0xFUL << (24U)))));
}
# 5042 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLL_GetDivider(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR) & ((0x3FUL << (0U)))));
}
# 5060 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_PLL_ConfigSpreadSpectrum(uint32_t Mod, uint32_t Inc, uint32_t Sel)
{
  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->SSCGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->SSCGR))) & (~((0x1FFFUL << (0U)) | (0x7FFFUL << (13U)) | (0x1UL << (30U))))) | (Mod | (Inc << (13U)) | Sel))));
}






static __inline uint32_t LL_RCC_PLL_GetPeriodModulation(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->SSCGR) & ((0x1FFFUL << (0U)))));
}







static __inline uint32_t LL_RCC_PLL_GetStepIncrementation(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->SSCGR) & ((0x7FFFUL << (13U)))) >> (13U));
}
# 5094 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLL_GetSpreadSelection(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->SSCGR) & ((0x1UL << (30U)))));
}






static __inline void LL_RCC_PLL_SpreadSpectrum_Enable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->SSCGR) |= ((0x1UL << (31U))));
}






static __inline void LL_RCC_PLL_SpreadSpectrum_Disable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->SSCGR) &= ~((0x1UL << (31U))));
}
# 5133 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_PLLI2S_Enable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) |= ((0x1UL << (26U))));
}






static __inline void LL_RCC_PLLI2S_Disable(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) &= ~((0x1UL << (26U))));
}






static __inline uint32_t LL_RCC_PLLI2S_IsReady(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CR) & ((0x1UL << (27U)))) == ((0x1UL << (27U))));
}
# 5661 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_PLLI2S_ConfigDomain_I2S(uint32_t Source, uint32_t PLLM, uint32_t PLLN, uint32_t PLLR)
{
  volatile uint32_t *pReg = (volatile uint32_t *)((uint32_t)((uint32_t)(&((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR) + (Source & 0x80U)));
  (((*pReg)) = ((((((*pReg))) & (~((0x1UL << (22U))))) | ((Source & (~0x80U))))));



  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR))) & (~((0x3FUL << (0U))))) | (PLLM))));

  (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLI2SCFGR)) = ((((((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLI2SCFGR))) & (~((0x1FFUL << (6U)) | (0x7UL << (28U))))) | (PLLN << (6U) | PLLR))));
}
# 5680 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLLI2S_GetN(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLI2SCFGR) & ((0x1FFUL << (6U)))) >> (6U));
}
# 5723 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLLI2S_GetR(void)
{
  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLI2SCFGR) & ((0x7UL << (28U)))));
}
# 5902 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLLI2S_GetDivider(void)
{



  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR) & ((0x3FUL << (0U)))));

}
# 5922 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_PLLI2S_GetMainSource(void)
{






  return (uint32_t)(((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->PLLCFGR) & ((0x1UL << (22U)))));

}
# 6541 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_ClearFlag_LSIRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (16U))));
}






static __inline void LL_RCC_ClearFlag_LSERDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (17U))));
}






static __inline void LL_RCC_ClearFlag_HSIRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (18U))));
}






static __inline void LL_RCC_ClearFlag_HSERDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (19U))));
}






static __inline void LL_RCC_ClearFlag_PLLRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (20U))));
}







static __inline void LL_RCC_ClearFlag_PLLI2SRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (21U))));
}
# 6617 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_ClearFlag_HSECSS(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (23U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_LSIRDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (0U)))) == ((0x1UL << (0U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_LSERDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (1U)))) == ((0x1UL << (1U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_HSIRDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (2U)))) == ((0x1UL << (2U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_HSERDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (3U)))) == ((0x1UL << (3U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_PLLRDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (4U)))) == ((0x1UL << (4U))));
}







static __inline uint32_t LL_RCC_IsActiveFlag_PLLI2SRDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (5U)))) == ((0x1UL << (5U))));
}
# 6701 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_IsActiveFlag_HSECSS(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (7U)))) == ((0x1UL << (7U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_IWDGRST(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) & ((0x1UL << (29U)))) == ((0x1UL << (29U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_LPWRRST(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) & ((0x1UL << (31U)))) == ((0x1UL << (31U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_PINRST(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) & ((0x1UL << (26U)))) == ((0x1UL << (26U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_PORRST(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) & ((0x1UL << (27U)))) == ((0x1UL << (27U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_SFTRST(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) & ((0x1UL << (28U)))) == ((0x1UL << (28U))));
}






static __inline uint32_t LL_RCC_IsActiveFlag_WWDGRST(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) & ((0x1UL << (30U)))) == ((0x1UL << (30U))));
}







static __inline uint32_t LL_RCC_IsActiveFlag_BORRST(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) & ((0x1UL << (25U)))) == ((0x1UL << (25U))));
}







static __inline void LL_RCC_ClearResetFlags(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CSR) |= ((0x1UL << (24U))));
}
# 6801 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_EnableIT_LSIRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (8U))));
}






static __inline void LL_RCC_EnableIT_LSERDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (9U))));
}






static __inline void LL_RCC_EnableIT_HSIRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (10U))));
}






static __inline void LL_RCC_EnableIT_HSERDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (11U))));
}






static __inline void LL_RCC_EnableIT_PLLRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (12U))));
}







static __inline void LL_RCC_EnableIT_PLLI2SRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) |= ((0x1UL << (13U))));
}
# 6875 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline void LL_RCC_DisableIT_LSIRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) &= ~((0x1UL << (8U))));
}






static __inline void LL_RCC_DisableIT_LSERDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) &= ~((0x1UL << (9U))));
}






static __inline void LL_RCC_DisableIT_HSIRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) &= ~((0x1UL << (10U))));
}






static __inline void LL_RCC_DisableIT_HSERDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) &= ~((0x1UL << (11U))));
}






static __inline void LL_RCC_DisableIT_PLLRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) &= ~((0x1UL << (12U))));
}







static __inline void LL_RCC_DisableIT_PLLI2SRDY(void)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) &= ~((0x1UL << (13U))));
}
# 6950 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
static __inline uint32_t LL_RCC_IsEnabledIT_LSIRDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (8U)))) == ((0x1UL << (8U))));
}






static __inline uint32_t LL_RCC_IsEnabledIT_LSERDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (9U)))) == ((0x1UL << (9U))));
}






static __inline uint32_t LL_RCC_IsEnabledIT_HSIRDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (10U)))) == ((0x1UL << (10U))));
}






static __inline uint32_t LL_RCC_IsEnabledIT_HSERDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (11U)))) == ((0x1UL << (11U))));
}






static __inline uint32_t LL_RCC_IsEnabledIT_PLLRDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (12U)))) == ((0x1UL << (12U))));
}







static __inline uint32_t LL_RCC_IsEnabledIT_PLLI2SRDY(void)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->CIR) & ((0x1UL << (13U)))) == ((0x1UL << (13U))));
}
# 7028 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
ErrorStatus LL_RCC_DeInit(void);







void LL_RCC_GetSystemClocksFreq(LL_RCC_ClocksTypeDef *RCC_Clocks);
# 7047 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_rcc.h"
uint32_t LL_RCC_GetSDIOClockFreq(uint32_t SDIOxSource);


uint32_t LL_RCC_GetRNGClockFreq(uint32_t RNGxSource);


uint32_t LL_RCC_GetUSBClockFreq(uint32_t USBxSource);





uint32_t LL_RCC_GetI2SClockFreq(uint32_t I2SxSource);
# 33 "../Core/Inc/main.h" 2
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h" 1
# 409 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB1_GRP1_EnableClock(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1ENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1ENR) & (Periphs));
  (void)tmpreg;
}
# 473 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline uint32_t LL_AHB1_GRP1_IsEnabledClock(uint32_t Periphs)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1ENR) & (Periphs)) == Periphs);
}
# 533 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB1_GRP1_DisableClock(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1ENR) &= ~(Periphs));
}
# 582 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB1_GRP1_ForceReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1RSTR) |= (Periphs));
}
# 631 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB1_GRP1_ReleaseReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1RSTR) &= ~(Periphs));
}
# 698 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB1_GRP1_EnableClockLowPower(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1LPENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1LPENR) & (Periphs));
  (void)tmpreg;
}
# 769 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB1_GRP1_DisableClockLowPower(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB1LPENR) &= ~(Periphs));
}
# 802 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB2_GRP1_EnableClock(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB2ENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB2ENR) & (Periphs));
  (void)tmpreg;
}
# 830 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline uint32_t LL_AHB2_GRP1_IsEnabledClock(uint32_t Periphs)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB2ENR) & (Periphs)) == Periphs);
}
# 854 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB2_GRP1_DisableClock(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB2ENR) &= ~(Periphs));
}
# 879 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB2_GRP1_ForceReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB2RSTR) |= (Periphs));
}
# 904 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB2_GRP1_ReleaseReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB2RSTR) &= ~(Periphs));
}
# 928 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB2_GRP1_EnableClockLowPower(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB2LPENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB2LPENR) & (Periphs));
  (void)tmpreg;
}
# 956 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB2_GRP1_DisableClockLowPower(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB2LPENR) &= ~(Periphs));
}
# 984 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB3_GRP1_EnableClock(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB3ENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB3ENR) & (Periphs));
  (void)tmpreg;
}
# 1006 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline uint32_t LL_AHB3_GRP1_IsEnabledClock(uint32_t Periphs)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB3ENR) & (Periphs)) == Periphs);
}
# 1024 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB3_GRP1_DisableClock(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB3ENR) &= ~(Periphs));
}
# 1043 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB3_GRP1_ForceReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB3RSTR) |= (Periphs));
}
# 1062 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB3_GRP1_ReleaseReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB3RSTR) &= ~(Periphs));
}
# 1080 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB3_GRP1_EnableClockLowPower(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB3LPENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB3LPENR) & (Periphs));
  (void)tmpreg;
}
# 1102 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_AHB3_GRP1_DisableClockLowPower(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->AHB3LPENR) &= ~(Periphs));
}
# 1185 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB1_GRP1_EnableClock(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB1ENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB1ENR) & (Periphs));
  (void)tmpreg;
}
# 1263 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline uint32_t LL_APB1_GRP1_IsEnabledClock(uint32_t Periphs)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB1ENR) & (Periphs)) == Periphs);
}
# 1337 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB1_GRP1_DisableClock(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB1ENR) &= ~(Periphs));
}
# 1409 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB1_GRP1_ForceReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB1RSTR) |= (Periphs));
}
# 1481 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB1_GRP1_ReleaseReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB1RSTR) &= ~(Periphs));
}
# 1555 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB1_GRP1_EnableClockLowPower(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB1LPENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB1LPENR) & (Periphs));
  (void)tmpreg;
}
# 1633 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB1_GRP1_DisableClockLowPower(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB1LPENR) &= ~(Periphs));
}
# 1704 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB2_GRP1_EnableClock(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB2ENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB2ENR) & (Periphs));
  (void)tmpreg;
}
# 1770 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline uint32_t LL_APB2_GRP1_IsEnabledClock(uint32_t Periphs)
{
  return (((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB2ENR) & (Periphs)) == Periphs);
}
# 1832 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB2_GRP1_DisableClock(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB2ENR) &= ~(Periphs));
}
# 1889 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB2_GRP1_ForceReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB2RSTR) |= (Periphs));
}
# 1947 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB2_GRP1_ReleaseReset(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB2RSTR) &= ~(Periphs));
}
# 2010 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB2_GRP1_EnableClockLowPower(uint32_t Periphs)
{
  volatile uint32_t tmpreg;
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB2LPENR) |= (Periphs));

  tmpreg = ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB2LPENR) & (Periphs));
  (void)tmpreg;
}
# 2077 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_bus.h"
static __inline void LL_APB2_GRP1_DisableClockLowPower(uint32_t Periphs)
{
  ((((RCC_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3800UL))->APB2LPENR) &= ~(Periphs));
}
# 34 "../Core/Inc/main.h" 2
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h" 1
# 466 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_SYSCFG_SetRemapMemory(uint32_t Memory)
{
  (((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->MEMRMP)) = ((((((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->MEMRMP))) & (~((0x3UL << (0U))))) | (Memory))));
}
# 481 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline uint32_t LL_SYSCFG_GetRemapMemory(void)
{
  return (uint32_t)(((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->MEMRMP) & ((0x3UL << (0U)))));
}
# 519 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_SYSCFG_EnableCompensationCell(void)
{
  ((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->CMPCR) |= ((0x1UL << (0U))));
}
# 531 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_SYSCFG_DisableCompensationCell(void)
{
  ((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->CMPCR) &= ~((0x1UL << (0U))));
}






static __inline uint32_t LL_SYSCFG_IsActiveFlag_CMPCR(void)
{
  return (((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->CMPCR) & ((0x1UL << (8U)))) == ((0x1UL << (8U))));
}
# 555 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_SYSCFG_SetPHYInterface(uint32_t Interface)
{
  (((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->PMC)) = ((((((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->PMC))) & (~((0x1UL << (23U))))) | (Interface))));
}
# 568 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline uint32_t LL_SYSCFG_GetPHYInterface(void)
{
  return (uint32_t)(((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->PMC) & ((0x1UL << (23U)))));
}
# 671 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_SYSCFG_SetEXTISource(uint32_t Port, uint32_t Line)
{
  (((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->EXTICR[Line & 0xFF])) = ((((((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->EXTICR[Line & 0xFF]))) & (~((Line >> 16)))) | (Port << ((uint8_t)__builtin_clz(__builtin_arm_rbit((Line >> 16))))))));
}
# 710 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline uint32_t LL_SYSCFG_GetEXTISource(uint32_t Line)
{
  return (uint32_t)(((((SYSCFG_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3800UL))->EXTICR[Line & 0xFF]) & ((Line >> 16))) >> ((uint8_t)__builtin_clz(__builtin_arm_rbit(Line >> 16))));
}
# 1251 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline uint32_t LL_DBGMCU_GetDeviceID(void)
{
  return (uint32_t)(((((DBGMCU_TypeDef *) 0xE0042000UL)->IDCODE) & ((0xFFFUL << (0U)))));
}
# 1268 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline uint32_t LL_DBGMCU_GetRevisionID(void)
{
  return (uint32_t)(((((DBGMCU_TypeDef *) 0xE0042000UL)->IDCODE) & ((0xFFFFUL << (16U)))) >> (16U));
}






static __inline void LL_DBGMCU_EnableDBGSleepMode(void)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->CR) |= ((0x1UL << (0U))));
}






static __inline void LL_DBGMCU_DisableDBGSleepMode(void)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->CR) &= ~((0x1UL << (0U))));
}






static __inline void LL_DBGMCU_EnableDBGStopMode(void)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->CR) |= ((0x1UL << (1U))));
}






static __inline void LL_DBGMCU_DisableDBGStopMode(void)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->CR) &= ~((0x1UL << (1U))));
}






static __inline void LL_DBGMCU_EnableDBGStandbyMode(void)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->CR) |= ((0x1UL << (2U))));
}






static __inline void LL_DBGMCU_DisableDBGStandbyMode(void)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->CR) &= ~((0x1UL << (2U))));
}
# 1345 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_DBGMCU_SetTracePinAssignment(uint32_t PinAssignment)
{
  (((((DBGMCU_TypeDef *) 0xE0042000UL)->CR)) = ((((((((DBGMCU_TypeDef *) 0xE0042000UL)->CR))) & (~((0x1UL << (5U)) | (0x3UL << (6U))))) | (PinAssignment))));
}
# 1361 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline uint32_t LL_DBGMCU_GetTracePinAssignment(void)
{
  return (uint32_t)(((((DBGMCU_TypeDef *) 0xE0042000UL)->CR) & ((0x1UL << (5U)) | (0x3UL << (6U)))));
}
# 1413 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_DBGMCU_APB1_GRP1_FreezePeriph(uint32_t Periphs)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->APB1FZ) |= (Periphs));
}
# 1465 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_DBGMCU_APB1_GRP1_UnFreezePeriph(uint32_t Periphs)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->APB1FZ) &= ~(Periphs));
}
# 1487 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_DBGMCU_APB2_GRP1_FreezePeriph(uint32_t Periphs)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->APB2FZ) |= (Periphs));
}
# 1509 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_DBGMCU_APB2_GRP1_UnFreezePeriph(uint32_t Periphs)
{
  ((((DBGMCU_TypeDef *) 0xE0042000UL)->APB2FZ) &= ~(Periphs));
}
# 1543 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline void LL_FLASH_SetLatency(uint32_t Latency)
{
  (((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR)) = ((((((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR))) & (~((0x7UL << (0U))))) | (Latency))));
}
# 1569 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_system.h"
static __inline uint32_t LL_FLASH_GetLatency(void)
{
  return (uint32_t)(((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) & ((0x7UL << (0U)))));
}






static __inline void LL_FLASH_EnablePrefetch(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) |= ((0x1UL << (8U))));
}






static __inline void LL_FLASH_DisablePrefetch(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) &= ~((0x1UL << (8U))));
}






static __inline uint32_t LL_FLASH_IsPrefetchEnabled(void)
{
  return (((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) & ((0x1UL << (8U)))) == ((0x1UL << (8U))));
}






static __inline void LL_FLASH_EnableInstCache(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) |= ((0x1UL << (9U))));
}






static __inline void LL_FLASH_DisableInstCache(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) &= ~((0x1UL << (9U))));
}






static __inline void LL_FLASH_EnableDataCache(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) |= ((0x1UL << (10U))));
}






static __inline void LL_FLASH_DisableDataCache(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) &= ~((0x1UL << (10U))));
}







static __inline void LL_FLASH_EnableInstCacheReset(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) |= ((0x1UL << (11U))));
}






static __inline void LL_FLASH_DisableInstCacheReset(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) &= ~((0x1UL << (11U))));
}







static __inline void LL_FLASH_EnableDataCacheReset(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) |= ((0x1UL << (12U))));
}






static __inline void LL_FLASH_DisableDataCacheReset(void)
{
  ((((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR) &= ~((0x1UL << (12U))));
}
# 35 "../Core/Inc/main.h" 2
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h" 1
# 57 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
typedef struct
{

  uint32_t Line_0_31;


  FunctionalState LineCommand;


  uint8_t Mode;


  uint8_t Trigger;

} LL_EXTI_InitTypeDef;
# 268 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_EnableIT_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->IMR) |= (ExtiLine));
}
# 309 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_DisableIT_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->IMR) &= ~(ExtiLine));
}
# 351 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline uint32_t LL_EXTI_IsEnabledIT_0_31(uint32_t ExtiLine)
{
  return (((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->IMR) & (ExtiLine)) == (ExtiLine));
}
# 398 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_EnableEvent_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->EMR) |= (ExtiLine));

}
# 438 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_DisableEvent_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->EMR) &= ~(ExtiLine));
}
# 477 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline uint32_t LL_EXTI_IsEnabledEvent_0_31(uint32_t ExtiLine)
{
  return (((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->EMR) & (ExtiLine)) == (ExtiLine));

}
# 529 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_EnableRisingTrig_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->RTSR) |= (ExtiLine));

}
# 573 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_DisableRisingTrig_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->RTSR) &= ~(ExtiLine));

}
# 610 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline uint32_t LL_EXTI_IsEnabledRisingTrig_0_31(uint32_t ExtiLine)
{
  return (((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->RTSR) & (ExtiLine)) == (ExtiLine));
}
# 661 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_EnableFallingTrig_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->FTSR) |= (ExtiLine));
}
# 703 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_DisableFallingTrig_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->FTSR) &= ~(ExtiLine));
}
# 739 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline uint32_t LL_EXTI_IsEnabledFallingTrig_0_31(uint32_t ExtiLine)
{
  return (((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->FTSR) & (ExtiLine)) == (ExtiLine));
}
# 788 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_GenerateSWI_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->SWIER) |= (ExtiLine));
}
# 834 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline uint32_t LL_EXTI_IsActiveFlag_0_31(uint32_t ExtiLine)
{
  return (((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->PR) & (ExtiLine)) == (ExtiLine));
}
# 872 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline uint32_t LL_EXTI_ReadFlag_0_31(uint32_t ExtiLine)
{
  return (uint32_t)(((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->PR) & (ExtiLine)));
}
# 910 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
static __inline void LL_EXTI_ClearFlag_0_31(uint32_t ExtiLine)
{
  ((((EXTI_TypeDef *) ((0x40000000UL + 0x00010000UL) + 0x3C00UL))->PR) = (ExtiLine));
}
# 925 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_exti.h"
uint32_t LL_EXTI_Init(LL_EXTI_InitTypeDef *EXTI_InitStruct);
uint32_t LL_EXTI_DeInit(void);
void LL_EXTI_StructInit(LL_EXTI_InitTypeDef *EXTI_InitStruct);
# 36 "../Core/Inc/main.h" 2
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h" 1
# 229 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline uint32_t LL_SYSTICK_IsActiveCounterFlag(void)
{
  return ((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL & (1UL << 16U)) == ((1UL << 16U)));
}
# 242 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline void LL_SYSTICK_SetClkSource(uint32_t Source)
{
  if (Source == (1UL << 2U))
  {
    ((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL) |= ((1UL << 2U)));
  }
  else
  {
    ((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL) &= ~((1UL << 2U)));
  }
}
# 261 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline uint32_t LL_SYSTICK_GetClkSource(void)
{
  return ((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL) & ((1UL << 2U)));
}






static __inline void LL_SYSTICK_EnableIT(void)
{
  ((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL) |= ((1UL << 1U)));
}






static __inline void LL_SYSTICK_DisableIT(void)
{
  ((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL) &= ~((1UL << 1U)));
}






static __inline uint32_t LL_SYSTICK_IsEnabledIT(void)
{
  return (((((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL) & ((1UL << 1U))) == ((1UL << 1U)));
}
# 309 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline void LL_LPM_EnableSleep(void)
{

  ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SCR) &= ~(((uint32_t)(1UL << 2U))));
}






static __inline void LL_LPM_EnableDeepSleep(void)
{

  ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SCR) |= (((uint32_t)(1UL << 2U))));
}
# 333 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline void LL_LPM_EnableSleepOnExit(void)
{

  ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SCR) |= (((uint32_t)(1UL << 1U))));
}






static __inline void LL_LPM_DisableSleepOnExit(void)
{

  ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SCR) &= ~(((uint32_t)(1UL << 1U))));
}







static __inline void LL_LPM_EnableEventOnPend(void)
{

  ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SCR) |= (((uint32_t)(1UL << 4U))));
}







static __inline void LL_LPM_DisableEventOnPend(void)
{

  ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SCR) &= ~(((uint32_t)(1UL << 4U))));
}
# 391 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline void LL_HANDLER_EnableFault(uint32_t Fault)
{

  ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR) |= (Fault));
}
# 406 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline void LL_HANDLER_DisableFault(uint32_t Fault)
{

  ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR) &= ~(Fault));
}
# 425 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline uint32_t LL_CPUID_GetImplementer(void)
{
  return (uint32_t)(((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CPUID) & ((0xFFUL << 24U))) >> 24U);
}






static __inline uint32_t LL_CPUID_GetVariant(void)
{
  return (uint32_t)(((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CPUID) & ((0xFUL << 20U))) >> 20U);
}






static __inline uint32_t LL_CPUID_GetConstant(void)
{
  return (uint32_t)(((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CPUID) & ((0xFUL << 16U))) >> 16U);
}






static __inline uint32_t LL_CPUID_GetParNo(void)
{
  return (uint32_t)(((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CPUID) & ((0xFFFUL << 4U))) >> 4U);
}






static __inline uint32_t LL_CPUID_GetRevision(void)
{
  return (uint32_t)(((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CPUID) & ((0xFUL ))) >> 0U);
}
# 489 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline void LL_MPU_Enable(uint32_t Options)
{

  ((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL) = (((1UL ) | Options)));

  __builtin_arm_dsb(0xF);;

  __builtin_arm_isb(0xF);;
}






static __inline void LL_MPU_Disable(void)
{

  __builtin_arm_dmb(0xF);;

  ((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL) = (0U));
}






static __inline uint32_t LL_MPU_IsEnabled(void)
{
  return (((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL) & ((1UL ))) == ((1UL )));
}
# 536 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline void LL_MPU_EnableRegion(uint32_t Region)
{

  ((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR) = (Region));

  ((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR) |= ((1UL )));
}
# 582 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline void LL_MPU_ConfigRegion(uint32_t Region, uint32_t SubRegionDisable, uint32_t Address, uint32_t Attributes)
{

  ((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR) = (Region));

  ((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR) = ((Address & 0xFFFFFFE0U)));

  ((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR) = (((1UL ) | Attributes | SubRegionDisable << 8U)));
}
# 607 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_cortex.h"
static __inline void LL_MPU_DisableRegion(uint32_t Region)
{

  ((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR) = (Region));

  ((((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR) &= ~((1UL )));
}
# 37 "../Core/Inc/main.h" 2
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_utils.h" 1
# 94 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_utils.h"
typedef struct
{
  uint32_t PLLM;





  uint32_t PLLN;






  uint32_t PLLP;




} LL_UTILS_PLLInitTypeDef;




typedef struct
{
  uint32_t AHBCLKDivider;





  uint32_t APB1CLKDivider;





  uint32_t APB2CLKDivider;





} LL_UTILS_ClkInitTypeDef;
# 192 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_utils.h"
static __inline uint32_t LL_GetUID_Word0(void)
{
  return (uint32_t)(((*((uint32_t *)0x1FFF7A10UL))));
}





static __inline uint32_t LL_GetUID_Word1(void)
{
  return (uint32_t)(((*((uint32_t *)(0x1FFF7A10UL + 4U)))));
}





static __inline uint32_t LL_GetUID_Word2(void)
{
  return (uint32_t)(((*((uint32_t *)(0x1FFF7A10UL + 8U)))));
}







static __inline uint32_t LL_GetFlashSize(void)
{
  return (uint32_t)(((*((uint32_t *)0x1FFF7A22UL))) & 0xFFFF);
}
# 239 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_utils.h"
static __inline uint32_t LL_GetPackageType(void)
{
  return (uint32_t)(((*((uint32_t *)0x1FFF7BF0UL))) & 0x0700U);
}
# 260 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_utils.h"
static __inline void LL_InitTick(uint32_t HCLKFrequency, uint32_t Ticks)
{

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)((HCLKFrequency / Ticks) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL );
}

void LL_Init1msTick(uint32_t HCLKFrequency);
void LL_mDelay(uint32_t Delay);
# 280 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_utils.h"
void LL_SetSystemCoreClock(uint32_t HCLKFrequency);
ErrorStatus LL_SetFlashLatency(uint32_t HCLK_Frequency);
ErrorStatus LL_PLL_ConfigSystemClock_HSI(LL_UTILS_PLLInitTypeDef *UTILS_PLLInitStruct,
                                         LL_UTILS_ClkInitTypeDef *UTILS_ClkInitStruct);
ErrorStatus LL_PLL_ConfigSystemClock_HSE(uint32_t HSEFrequency, uint32_t HSEBypass,
                                         LL_UTILS_PLLInitTypeDef *UTILS_PLLInitStruct, LL_UTILS_ClkInitTypeDef *UTILS_ClkInitStruct);
# 38 "../Core/Inc/main.h" 2
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h" 1
# 505 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline void LL_PWR_SetRegulVoltageScaling(uint32_t VoltageScaling)
{
  (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR)) = ((((((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR))) & (~((0x1UL << (14U))))) | (VoltageScaling))));
}
# 519 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline uint32_t LL_PWR_GetRegulVoltageScaling(void)
{
  return (uint32_t)(((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) & ((0x1UL << (14U)))));
}





static __inline void LL_PWR_EnableFlashPowerDown(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) |= ((0x1UL << (9U))));
}






static __inline void LL_PWR_DisableFlashPowerDown(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) &= ~((0x1UL << (9U))));
}






static __inline uint32_t LL_PWR_IsEnabledFlashPowerDown(void)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) & ((0x1UL << (9U)))) == ((0x1UL << (9U))));
}






static __inline void LL_PWR_EnableBkUpAccess(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) |= ((0x1UL << (8U))));
}






static __inline void LL_PWR_DisableBkUpAccess(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) &= ~((0x1UL << (8U))));
}






static __inline uint32_t LL_PWR_IsEnabledBkUpAccess(void)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) & ((0x1UL << (8U)))) == ((0x1UL << (8U))));
}







static __inline void LL_PWR_EnableBkUpRegulator(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) |= ((0x1UL << (9U))));
}
# 601 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline void LL_PWR_DisableBkUpRegulator(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) &= ~((0x1UL << (9U))));
}






static __inline uint32_t LL_PWR_IsEnabledBkUpRegulator(void)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) & ((0x1UL << (9U)))) == ((0x1UL << (9U))));
}
# 624 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline void LL_PWR_SetRegulModeDS(uint32_t RegulMode)
{
  (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR)) = ((((((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR))) & (~((0x1UL << (0U))))) | (RegulMode))));
}
# 636 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline uint32_t LL_PWR_GetRegulModeDS(void)
{
  return (uint32_t)(((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) & ((0x1UL << (0U)))));
}
# 663 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline void LL_PWR_SetPowerMode(uint32_t PDMode)
{





  (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR)) = ((((((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR))) & (~(((0x1UL << (1U))| (0x1UL << (0U)))))) | (PDMode))));

}
# 695 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline uint32_t LL_PWR_GetPowerMode(void)
{





  return (uint32_t)(((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) & (((0x1UL << (1U))| (0x1UL << (0U))))));

}
# 720 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline void LL_PWR_SetPVDLevel(uint32_t PVDLevel)
{
  (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR)) = ((((((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR))) & (~((0x7UL << (5U))))) | (PVDLevel))));
}
# 738 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline uint32_t LL_PWR_GetPVDLevel(void)
{
  return (uint32_t)(((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) & ((0x7UL << (5U)))));
}






static __inline void LL_PWR_EnablePVD(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) |= ((0x1UL << (4U))));
}






static __inline void LL_PWR_DisablePVD(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) &= ~((0x1UL << (4U))));
}






static __inline uint32_t LL_PWR_IsEnabledPVD(void)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) & ((0x1UL << (4U)))) == ((0x1UL << (4U))));
}
# 787 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline void LL_PWR_EnableWakeUpPin(uint32_t WakeUpPin)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) |= (WakeUpPin));
}
# 806 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline void LL_PWR_DisableWakeUpPin(uint32_t WakeUpPin)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) &= ~(WakeUpPin));
}
# 825 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline uint32_t LL_PWR_IsEnabledWakeUpPin(uint32_t WakeUpPin)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) & (WakeUpPin)) == (WakeUpPin));
}
# 844 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline uint32_t LL_PWR_IsActiveFlag_WU(void)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) & ((0x1UL << (0U)))) == ((0x1UL << (0U))));
}






static __inline uint32_t LL_PWR_IsActiveFlag_SB(void)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) & ((0x1UL << (1U)))) == ((0x1UL << (1U))));
}






static __inline uint32_t LL_PWR_IsActiveFlag_BRR(void)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) & ((0x1UL << (3U)))) == ((0x1UL << (3U))));
}





static __inline uint32_t LL_PWR_IsActiveFlag_PVDO(void)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) & ((0x1UL << (2U)))) == ((0x1UL << (2U))));
}






static __inline uint32_t LL_PWR_IsActiveFlag_VOS(void)
{
  return (((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CSR) & ((0x1UL << (14U)))) == ((0x1UL << (14U))));
}
# 927 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
static __inline void LL_PWR_ClearFlag_SB(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) |= ((0x1UL << (3U))));
}






static __inline void LL_PWR_ClearFlag_WU(void)
{
  ((((PWR_TypeDef *) (0x40000000UL + 0x7000UL))->CR) |= ((0x1UL << (2U))));
}
# 961 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_pwr.h"
ErrorStatus LL_PWR_DeInit(void);
# 39 "../Core/Inc/main.h" 2
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h" 1
# 73 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
typedef struct
{
  uint32_t BaudRate;



  uint32_t DataWidth;




  uint32_t StopBits;




  uint32_t Parity;




  uint32_t TransferDirection;




  uint32_t HardwareFlowControl;




  uint32_t OverSampling;




} LL_USART_InitTypeDef;




typedef struct
{
  uint32_t ClockOutput;






  uint32_t ClockPolarity;





  uint32_t ClockPhase;





  uint32_t LastBitClockPulse;






} LL_USART_ClockInitTypeDef;
# 410 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_Enable(USART_TypeDef *USARTx)
{
  ((USARTx->CR1) |= ((0x1UL << (13U))));
}
# 424 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_Disable(USART_TypeDef *USARTx)
{
  ((USARTx->CR1) &= ~((0x1UL << (13U))));
}







static __inline uint32_t LL_USART_IsEnabled(USART_TypeDef *USARTx)
{
  return (((USARTx->CR1) & ((0x1UL << (13U)))) == ((0x1UL << (13U))));
}







static __inline void LL_USART_EnableDirectionRx(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) | ((0x1UL << (2U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_DisableDirectionRx(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) & ~((0x1UL << (2U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_EnableDirectionTx(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) | ((0x1UL << (3U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_DisableDirectionTx(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) & ~((0x1UL << (3U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}
# 497 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetTransferDirection(USART_TypeDef *USARTx, uint32_t TransferDirection)
{
  do { uint32_t val; do { val = ((uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) & ~((0x1UL << (2U)) | (0x1UL << (3U)))) | (TransferDirection); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}
# 513 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetTransferDirection(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR1) & ((0x1UL << (2U)) | (0x1UL << (3U)))));
}
# 532 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetParity(USART_TypeDef *USARTx, uint32_t Parity)
{
  (((USARTx->CR1)) = ((((((USARTx->CR1))) & (~((0x1UL << (9U)) | (0x1UL << (10U))))) | (Parity))));
}
# 547 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetParity(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR1) & ((0x1UL << (9U)) | (0x1UL << (10U)))));
}
# 561 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetWakeUpMethod(USART_TypeDef *USARTx, uint32_t Method)
{
  (((USARTx->CR1)) = ((((((USARTx->CR1))) & (~((0x1UL << (11U))))) | (Method))));
}
# 574 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetWakeUpMethod(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR1) & ((0x1UL << (11U)))));
}
# 588 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetDataWidth(USART_TypeDef *USARTx, uint32_t DataWidth)
{
  (((USARTx->CR1)) = ((((((USARTx->CR1))) & (~((0x1UL << (12U))))) | (DataWidth))));
}
# 601 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetDataWidth(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR1) & ((0x1UL << (12U)))));
}
# 615 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetOverSampling(USART_TypeDef *USARTx, uint32_t OverSampling)
{
  (((USARTx->CR1)) = ((((((USARTx->CR1))) & (~((0x1UL << (15U))))) | (OverSampling))));
}
# 628 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetOverSampling(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR1) & ((0x1UL << (15U)))));
}
# 644 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetLastClkPulseOutput(USART_TypeDef *USARTx, uint32_t LastBitClockPulse)
{
  (((USARTx->CR2)) = ((((((USARTx->CR2))) & (~((0x1UL << (8U))))) | (LastBitClockPulse))));
}
# 660 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetLastClkPulseOutput(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR2) & ((0x1UL << (8U)))));
}
# 676 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetClockPhase(USART_TypeDef *USARTx, uint32_t ClockPhase)
{
  (((USARTx->CR2)) = ((((((USARTx->CR2))) & (~((0x1UL << (9U))))) | (ClockPhase))));
}
# 691 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetClockPhase(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR2) & ((0x1UL << (9U)))));
}
# 707 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetClockPolarity(USART_TypeDef *USARTx, uint32_t ClockPolarity)
{
  (((USARTx->CR2)) = ((((((USARTx->CR2))) & (~((0x1UL << (10U))))) | (ClockPolarity))));
}
# 722 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetClockPolarity(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR2) & ((0x1UL << (10U)))));
}
# 750 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ConfigClock(USART_TypeDef *USARTx, uint32_t Phase, uint32_t Polarity, uint32_t LBCPOutput)
{
  (((USARTx->CR2)) = ((((((USARTx->CR2))) & (~((0x1UL << (9U)) | (0x1UL << (10U)) | (0x1UL << (8U))))) | (Phase | Polarity | LBCPOutput))));
}
# 763 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableSCLKOutput(USART_TypeDef *USARTx)
{
  ((USARTx->CR2) |= ((0x1UL << (11U))));
}
# 776 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableSCLKOutput(USART_TypeDef *USARTx)
{
  ((USARTx->CR2) &= ~((0x1UL << (11U))));
}
# 789 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsEnabledSCLKOutput(USART_TypeDef *USARTx)
{
  return (((USARTx->CR2) & ((0x1UL << (11U)))) == ((0x1UL << (11U))));
}
# 805 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetStopBitsLength(USART_TypeDef *USARTx, uint32_t StopBits)
{
  (((USARTx->CR2)) = ((((((USARTx->CR2))) & (~((0x3UL << (12U))))) | (StopBits))));
}
# 820 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetStopBitsLength(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR2) & ((0x3UL << (12U)))));
}
# 850 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ConfigCharacter(USART_TypeDef *USARTx, uint32_t DataWidth, uint32_t Parity,
                                              uint32_t StopBits)
{
  (((USARTx->CR1)) = ((((((USARTx->CR1))) & (~((0x1UL << (9U)) | (0x1UL << (10U)) | (0x1UL << (12U))))) | (Parity | DataWidth))));
  (((USARTx->CR2)) = ((((((USARTx->CR2))) & (~((0x3UL << (12U))))) | (StopBits))));
}
# 866 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetNodeAddress(USART_TypeDef *USARTx, uint32_t NodeAddress)
{
  (((USARTx->CR2)) = ((((((USARTx->CR2))) & (~((0xFUL << (0U))))) | ((NodeAddress & (0xFUL << (0U)))))));
}
# 878 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetNodeAddress(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR2) & ((0xFUL << (0U)))));
}
# 891 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableRTSHWFlowCtrl(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) |= ((0x1UL << (8U))));
}
# 904 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableRTSHWFlowCtrl(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) &= ~((0x1UL << (8U))));
}
# 917 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableCTSHWFlowCtrl(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) |= ((0x1UL << (9U))));
}
# 930 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableCTSHWFlowCtrl(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) &= ~((0x1UL << (9U))));
}
# 949 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetHWFlowCtrl(USART_TypeDef *USARTx, uint32_t HardwareFlowControl)
{
  (((USARTx->CR3)) = ((((((USARTx->CR3))) & (~((0x1UL << (8U)) | (0x1UL << (9U))))) | (HardwareFlowControl))));
}
# 967 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetHWFlowCtrl(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR3) & ((0x1UL << (8U)) | (0x1UL << (9U)))));
}







static __inline void LL_USART_EnableOneBitSamp(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) |= ((0x1UL << (11U))));
}







static __inline void LL_USART_DisableOneBitSamp(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) &= ~((0x1UL << (11U))));
}







static __inline uint32_t LL_USART_IsEnabledOneBitSamp(USART_TypeDef *USARTx)
{
  return (((USARTx->CR3) & ((0x1UL << (11U)))) == ((0x1UL << (11U))));
}
# 1020 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetBaudRate(USART_TypeDef *USARTx, uint32_t PeriphClk, uint32_t OverSampling,
                                          uint32_t BaudRate)
{
  if (OverSampling == (0x1UL << (15U)))
  {
    USARTx->BRR = (uint16_t)(((((((uint32_t)((((uint64_t)(((PeriphClk))))*25)/(2*((uint64_t)(((BaudRate)))))))/100) << 4) + ((((((((uint32_t)((((uint64_t)(((PeriphClk))))*25)/(2*((uint64_t)(((BaudRate))))))) - ((((uint32_t)((((uint64_t)((((PeriphClk)))))*25)/(2*((uint64_t)((((BaudRate))))))))/100) * 100)) * 8) + 50) / 100) & 0xF8) << 1)) + (((((((uint32_t)((((uint64_t)(((PeriphClk))))*25)/(2*((uint64_t)(((BaudRate))))))) - ((((uint32_t)((((uint64_t)((((PeriphClk)))))*25)/(2*((uint64_t)((((BaudRate))))))))/100) * 100)) * 8) + 50) / 100) & 0x07)));
  }
  else
  {
    USARTx->BRR = (uint16_t)(((((((uint32_t)((((uint64_t)(((PeriphClk))))*25)/(4*((uint64_t)(((BaudRate)))))))/100) << 4) + (((((((uint32_t)((((uint64_t)(((PeriphClk))))*25)/(4*((uint64_t)(((BaudRate))))))) - ((((uint32_t)((((uint64_t)((((PeriphClk)))))*25)/(4*((uint64_t)((((BaudRate))))))))/100) * 100)) * 16) + 50) / 100) & 0xF0)) + (((((((uint32_t)((((uint64_t)(((PeriphClk))))*25)/(4*((uint64_t)(((BaudRate))))))) - ((((uint32_t)((((uint64_t)((((PeriphClk)))))*25)/(4*((uint64_t)((((BaudRate))))))))/100) * 100)) * 16) + 50) / 100) & 0x0F)));
  }
}
# 1045 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetBaudRate(USART_TypeDef *USARTx, uint32_t PeriphClk, uint32_t OverSampling)
{
  uint32_t usartdiv = 0x0U;
  uint32_t brrresult = 0x0U;

  usartdiv = USARTx->BRR;

  if (OverSampling == (0x1UL << (15U)))
  {
    if ((usartdiv & 0xFFF7U) != 0U)
    {
      usartdiv = (uint16_t)((usartdiv & 0xFFF0U) | ((usartdiv & 0x0007U) << 1U)) ;
      brrresult = (PeriphClk * 2U) / usartdiv;
    }
  }
  else
  {
    if ((usartdiv & 0xFFFFU) != 0U)
    {
      brrresult = PeriphClk / usartdiv;
    }
  }
  return (brrresult);
}
# 1086 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableIrda(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) |= ((0x1UL << (1U))));
}
# 1099 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableIrda(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) &= ~((0x1UL << (1U))));
}
# 1112 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsEnabledIrda(USART_TypeDef *USARTx)
{
  return (((USARTx->CR3) & ((0x1UL << (1U)))) == ((0x1UL << (1U))));
}
# 1128 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetIrdaPowerMode(USART_TypeDef *USARTx, uint32_t PowerMode)
{
  (((USARTx->CR3)) = ((((((USARTx->CR3))) & (~((0x1UL << (2U))))) | (PowerMode))));
}
# 1143 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetIrdaPowerMode(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR3) & ((0x1UL << (2U)))));
}
# 1158 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetIrdaPrescaler(USART_TypeDef *USARTx, uint32_t PrescalerValue)
{
  (((USARTx->GTPR)) = ((((((USARTx->GTPR))) & (~((0xFFUL << (0U))))) | (PrescalerValue))));
}
# 1172 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetIrdaPrescaler(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->GTPR) & ((0xFFUL << (0U)))));
}
# 1193 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableSmartcardNACK(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) |= ((0x1UL << (4U))));
}
# 1206 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableSmartcardNACK(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) &= ~((0x1UL << (4U))));
}
# 1219 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsEnabledSmartcardNACK(USART_TypeDef *USARTx)
{
  return (((USARTx->CR3) & ((0x1UL << (4U)))) == ((0x1UL << (4U))));
}
# 1232 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableSmartcard(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) |= ((0x1UL << (5U))));
}
# 1245 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableSmartcard(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) &= ~((0x1UL << (5U))));
}
# 1258 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsEnabledSmartcard(USART_TypeDef *USARTx)
{
  return (((USARTx->CR3) & ((0x1UL << (5U)))) == ((0x1UL << (5U))));
}
# 1273 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetSmartcardPrescaler(USART_TypeDef *USARTx, uint32_t PrescalerValue)
{
  (((USARTx->GTPR)) = ((((((USARTx->GTPR))) & (~((0xFFUL << (0U))))) | (PrescalerValue))));
}
# 1287 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetSmartcardPrescaler(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->GTPR) & ((0xFFUL << (0U)))));
}
# 1302 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetSmartcardGuardTime(USART_TypeDef *USARTx, uint32_t GuardTime)
{
  (((USARTx->GTPR)) = ((((((USARTx->GTPR))) & (~((0xFFUL << (8U))))) | (GuardTime << (8U)))));
}
# 1316 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetSmartcardGuardTime(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->GTPR) & ((0xFFUL << (8U)))) >> (8U));
}
# 1337 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableHalfDuplex(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) |= ((0x1UL << (3U))));
}
# 1350 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableHalfDuplex(USART_TypeDef *USARTx)
{
  ((USARTx->CR3) &= ~((0x1UL << (3U))));
}
# 1363 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsEnabledHalfDuplex(USART_TypeDef *USARTx)
{
  return (((USARTx->CR3) & ((0x1UL << (3U)))) == ((0x1UL << (3U))));
}
# 1387 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_SetLINBrkDetectionLen(USART_TypeDef *USARTx, uint32_t LINBDLength)
{
  (((USARTx->CR2)) = ((((((USARTx->CR2))) & (~((0x1UL << (5U))))) | (LINBDLength))));
}
# 1402 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_GetLINBrkDetectionLen(USART_TypeDef *USARTx)
{
  return (uint32_t)(((USARTx->CR2) & ((0x1UL << (5U)))));
}
# 1415 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableLIN(USART_TypeDef *USARTx)
{
  ((USARTx->CR2) |= ((0x1UL << (14U))));
}
# 1428 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableLIN(USART_TypeDef *USARTx)
{
  ((USARTx->CR2) &= ~((0x1UL << (14U))));
}
# 1441 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsEnabledLIN(USART_TypeDef *USARTx)
{
  return (((USARTx->CR2) & ((0x1UL << (14U)))) == ((0x1UL << (14U))));
}
# 1479 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ConfigAsyncMode(USART_TypeDef *USARTx)
{



  ((USARTx->CR2) &= ~(((0x1UL << (14U)) | (0x1UL << (11U)))));
  ((USARTx->CR3) &= ~(((0x1UL << (5U)) | (0x1UL << (1U)) | (0x1UL << (3U)))));
}
# 1515 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ConfigSyncMode(USART_TypeDef *USARTx)
{



  ((USARTx->CR2) &= ~(((0x1UL << (14U)))));
  ((USARTx->CR3) &= ~(((0x1UL << (5U)) | (0x1UL << (1U)) | (0x1UL << (3U)))));

  ((USARTx->CR2) |= ((0x1UL << (11U))));
}
# 1555 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ConfigLINMode(USART_TypeDef *USARTx)
{



  ((USARTx->CR2) &= ~(((0x1UL << (11U)) | (0x3UL << (12U)))));
  ((USARTx->CR3) &= ~(((0x1UL << (1U)) | (0x1UL << (5U)) | (0x1UL << (3U)))));

  ((USARTx->CR2) |= ((0x1UL << (14U))));
}
# 1593 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ConfigHalfDuplexMode(USART_TypeDef *USARTx)
{



  ((USARTx->CR2) &= ~(((0x1UL << (14U)) | (0x1UL << (11U)))));
  ((USARTx->CR3) &= ~(((0x1UL << (5U)) | (0x1UL << (1U)))));

  ((USARTx->CR3) |= ((0x1UL << (3U))));
}
# 1633 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ConfigSmartcardMode(USART_TypeDef *USARTx)
{



  ((USARTx->CR2) &= ~(((0x1UL << (14U)))));
  ((USARTx->CR3) &= ~(((0x1UL << (1U)) | (0x1UL << (3U)))));


  ((USARTx->CR2) |= (((0x1UL << (12U)) | (0x2UL << (12U)) | (0x1UL << (11U)))));

  ((USARTx->CR3) |= ((0x1UL << (5U))));
}
# 1676 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ConfigIrdaMode(USART_TypeDef *USARTx)
{



  ((USARTx->CR2) &= ~(((0x1UL << (14U)) | (0x1UL << (11U)) | (0x3UL << (12U)))));
  ((USARTx->CR3) &= ~(((0x1UL << (5U)) | (0x1UL << (3U)))));

  ((USARTx->CR3) |= ((0x1UL << (1U))));
}
# 1714 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ConfigMultiProcessMode(USART_TypeDef *USARTx)
{



  ((USARTx->CR2) &= ~(((0x1UL << (14U)) | (0x1UL << (11U)))));
  ((USARTx->CR3) &= ~(((0x1UL << (5U)) | (0x1UL << (3U)) | (0x1UL << (1U)))));
}
# 1737 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsActiveFlag_PE(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (0U)))) == ((0x1UL << (0U))));
}







static __inline uint32_t LL_USART_IsActiveFlag_FE(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (1U)))) == ((0x1UL << (1U))));
}







static __inline uint32_t LL_USART_IsActiveFlag_NE(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (2U)))) == ((0x1UL << (2U))));
}







static __inline uint32_t LL_USART_IsActiveFlag_ORE(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (3U)))) == ((0x1UL << (3U))));
}







static __inline uint32_t LL_USART_IsActiveFlag_IDLE(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (4U)))) == ((0x1UL << (4U))));
}







static __inline uint32_t LL_USART_IsActiveFlag_RXNE(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (5U)))) == ((0x1UL << (5U))));
}







static __inline uint32_t LL_USART_IsActiveFlag_TC(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (6U)))) == ((0x1UL << (6U))));
}







static __inline uint32_t LL_USART_IsActiveFlag_TXE(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (7U)))) == ((0x1UL << (7U))));
}
# 1827 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsActiveFlag_LBD(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (8U)))) == ((0x1UL << (8U))));
}
# 1840 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsActiveFlag_nCTS(USART_TypeDef *USARTx)
{
  return (((USARTx->SR) & ((0x1UL << (9U)))) == ((0x1UL << (9U))));
}







static __inline uint32_t LL_USART_IsActiveFlag_SBK(USART_TypeDef *USARTx)
{
  return (((USARTx->CR1) & ((0x1UL << (0U)))) == ((0x1UL << (0U))));
}







static __inline uint32_t LL_USART_IsActiveFlag_RWU(USART_TypeDef *USARTx)
{
  return (((USARTx->CR1) & ((0x1UL << (1U)))) == ((0x1UL << (1U))));
}
# 1877 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ClearFlag_PE(USART_TypeDef *USARTx)
{
  volatile uint32_t tmpreg;
  tmpreg = USARTx->SR;
  (void) tmpreg;
  tmpreg = USARTx->DR;
  (void) tmpreg;
}
# 1896 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ClearFlag_FE(USART_TypeDef *USARTx)
{
  volatile uint32_t tmpreg;
  tmpreg = USARTx->SR;
  (void) tmpreg;
  tmpreg = USARTx->DR;
  (void) tmpreg;
}
# 1915 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ClearFlag_NE(USART_TypeDef *USARTx)
{
  volatile uint32_t tmpreg;
  tmpreg = USARTx->SR;
  (void) tmpreg;
  tmpreg = USARTx->DR;
  (void) tmpreg;
}
# 1934 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ClearFlag_ORE(USART_TypeDef *USARTx)
{
  volatile uint32_t tmpreg;
  tmpreg = USARTx->SR;
  (void) tmpreg;
  tmpreg = USARTx->DR;
  (void) tmpreg;
}
# 1953 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ClearFlag_IDLE(USART_TypeDef *USARTx)
{
  volatile uint32_t tmpreg;
  tmpreg = USARTx->SR;
  (void) tmpreg;
  tmpreg = USARTx->DR;
  (void) tmpreg;
}







static __inline void LL_USART_ClearFlag_TC(USART_TypeDef *USARTx)
{
  ((USARTx->SR) = (~((0x1UL << (6U)))));
}







static __inline void LL_USART_ClearFlag_RXNE(USART_TypeDef *USARTx)
{
  ((USARTx->SR) = (~((0x1UL << (5U)))));
}
# 1992 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ClearFlag_LBD(USART_TypeDef *USARTx)
{
  ((USARTx->SR) = (~((0x1UL << (8U)))));
}
# 2005 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_ClearFlag_nCTS(USART_TypeDef *USARTx)
{
  ((USARTx->SR) = (~((0x1UL << (9U)))));
}
# 2024 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableIT_IDLE(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) | ((0x1UL << (4U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_EnableIT_RXNE(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) | ((0x1UL << (5U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_EnableIT_TC(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) | ((0x1UL << (6U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_EnableIT_TXE(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) | ((0x1UL << (7U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_EnableIT_PE(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) | ((0x1UL << (8U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}
# 2081 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableIT_LBD(USART_TypeDef *USARTx)
{
  ((USARTx->CR2) |= ((0x1UL << (6U))));
}
# 2096 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableIT_ERROR(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR3)) | ((0x1UL << (0U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR3))) != 0U); } while(0);
}
# 2109 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableIT_CTS(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR3)) | ((0x1UL << (10U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR3))) != 0U); } while(0);
}







static __inline void LL_USART_DisableIT_IDLE(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) & ~((0x1UL << (4U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_DisableIT_RXNE(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) & ~((0x1UL << (5U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_DisableIT_TC(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) & ~((0x1UL << (6U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_DisableIT_TXE(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) & ~((0x1UL << (7U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}







static __inline void LL_USART_DisableIT_PE(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR1)) & ~((0x1UL << (8U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR1))) != 0U); } while(0);
}
# 2177 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableIT_LBD(USART_TypeDef *USARTx)
{
  ((USARTx->CR2) &= ~((0x1UL << (6U))));
}
# 2192 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableIT_ERROR(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR3)) & ~((0x1UL << (0U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR3))) != 0U); } while(0);
}
# 2205 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_DisableIT_CTS(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR3)) & ~((0x1UL << (10U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR3))) != 0U); } while(0);
}







static __inline uint32_t LL_USART_IsEnabledIT_IDLE(USART_TypeDef *USARTx)
{
  return (((USARTx->CR1) & ((0x1UL << (4U)))) == ((0x1UL << (4U))));
}







static __inline uint32_t LL_USART_IsEnabledIT_RXNE(USART_TypeDef *USARTx)
{
  return (((USARTx->CR1) & ((0x1UL << (5U)))) == ((0x1UL << (5U))));
}







static __inline uint32_t LL_USART_IsEnabledIT_TC(USART_TypeDef *USARTx)
{
  return (((USARTx->CR1) & ((0x1UL << (6U)))) == ((0x1UL << (6U))));
}







static __inline uint32_t LL_USART_IsEnabledIT_TXE(USART_TypeDef *USARTx)
{
  return (((USARTx->CR1) & ((0x1UL << (7U)))) == ((0x1UL << (7U))));
}







static __inline uint32_t LL_USART_IsEnabledIT_PE(USART_TypeDef *USARTx)
{
  return (((USARTx->CR1) & ((0x1UL << (8U)))) == ((0x1UL << (8U))));
}
# 2273 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsEnabledIT_LBD(USART_TypeDef *USARTx)
{
  return (((USARTx->CR2) & ((0x1UL << (6U)))) == ((0x1UL << (6U))));
}







static __inline uint32_t LL_USART_IsEnabledIT_ERROR(USART_TypeDef *USARTx)
{
  return (((USARTx->CR3) & ((0x1UL << (0U)))) == ((0x1UL << (0U))));
}
# 2297 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_IsEnabledIT_CTS(USART_TypeDef *USARTx)
{
  return (((USARTx->CR3) & ((0x1UL << (10U)))) == ((0x1UL << (10U))));
}
# 2316 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_EnableDMAReq_RX(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR3)) | ((0x1UL << (6U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR3))) != 0U); } while(0);
}







static __inline void LL_USART_DisableDMAReq_RX(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR3)) & ~((0x1UL << (6U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR3))) != 0U); } while(0);
}







static __inline uint32_t LL_USART_IsEnabledDMAReq_RX(USART_TypeDef *USARTx)
{
  return (((USARTx->CR3) & ((0x1UL << (6U)))) == ((0x1UL << (6U))));
}







static __inline void LL_USART_EnableDMAReq_TX(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR3)) | ((0x1UL << (7U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR3))) != 0U); } while(0);
}







static __inline void LL_USART_DisableDMAReq_TX(USART_TypeDef *USARTx)
{
  do { uint32_t val; do { val = (uint32_t)__builtin_arm_ldrex((volatile uint32_t *)&(USARTx->CR3)) & ~((0x1UL << (7U))); } while (((uint32_t)__builtin_arm_strex(val,(volatile uint32_t *)&(USARTx->CR3))) != 0U); } while(0);
}







static __inline uint32_t LL_USART_IsEnabledDMAReq_TX(USART_TypeDef *USARTx)
{
  return (((USARTx->CR3) & ((0x1UL << (7U)))) == ((0x1UL << (7U))));
}
# 2383 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint32_t LL_USART_DMA_GetRegAddr(USART_TypeDef *USARTx)
{

  return ((uint32_t) &(USARTx->DR));
}
# 2403 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline uint8_t LL_USART_ReceiveData8(USART_TypeDef *USARTx)
{
  return (uint8_t)(((USARTx->DR) & ((0x1FFUL << (0U)))));
}







static __inline uint16_t LL_USART_ReceiveData9(USART_TypeDef *USARTx)
{
  return (uint16_t)(((USARTx->DR) & ((0x1FFUL << (0U)))));
}
# 2426 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_TransmitData8(USART_TypeDef *USARTx, uint8_t Value)
{
  USARTx->DR = Value;
}
# 2438 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_TransmitData9(USART_TypeDef *USARTx, uint16_t Value)
{
  USARTx->DR = Value & 0x1FFU;
}
# 2457 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
static __inline void LL_USART_RequestBreakSending(USART_TypeDef *USARTx)
{
  ((USARTx->CR1) |= ((0x1UL << (0U))));
}







static __inline void LL_USART_RequestEnterMuteMode(USART_TypeDef *USARTx)
{
  ((USARTx->CR1) |= ((0x1UL << (1U))));
}







static __inline void LL_USART_RequestExitMuteMode(USART_TypeDef *USARTx)
{
  ((USARTx->CR1) &= ~((0x1UL << (1U))));
}
# 2492 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_usart.h"
ErrorStatus LL_USART_DeInit(USART_TypeDef *USARTx);
ErrorStatus LL_USART_Init(USART_TypeDef *USARTx, LL_USART_InitTypeDef *USART_InitStruct);
void LL_USART_StructInit(LL_USART_InitTypeDef *USART_InitStruct);
ErrorStatus LL_USART_ClockInit(USART_TypeDef *USARTx, LL_USART_ClockInitTypeDef *USART_ClockInitStruct);
void LL_USART_ClockStructInit(LL_USART_ClockInitTypeDef *USART_ClockInitStruct);
# 40 "../Core/Inc/main.h" 2
# 1 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h" 1
# 63 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
typedef struct
{
  uint32_t Pin;


  uint32_t Mode;




  uint32_t Speed;




  uint32_t OutputType;




  uint32_t Pull;




  uint32_t Alternate;



} LL_GPIO_InitTypeDef;
# 273 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_SetPinMode(GPIO_TypeDef *GPIOx, uint32_t Pin, uint32_t Mode)
{
  (((GPIOx->MODER)) = ((((((GPIOx->MODER))) & (~(((0x3UL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U))))) | ((Mode << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U))))));
}
# 307 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_GetPinMode(GPIO_TypeDef *GPIOx, uint32_t Pin)
{
  return (uint32_t)(((GPIOx->MODER) & (((0x3UL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U)))) >> (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U));

}
# 342 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_SetPinOutputType(GPIO_TypeDef *GPIOx, uint32_t PinMask, uint32_t OutputType)
{
  (((GPIOx->OTYPER)) = ((((((GPIOx->OTYPER))) & (~(PinMask))) | ((PinMask * OutputType)))));
}
# 376 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_GetPinOutputType(GPIO_TypeDef *GPIOx, uint32_t Pin)
{
  return (uint32_t)(((GPIOx->OTYPER) & (Pin)) >> ((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))));
}
# 413 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_SetPinSpeed(GPIO_TypeDef *GPIOx, uint32_t Pin, uint32_t Speed)
{
  (((GPIOx->OSPEEDR)) = ((((((GPIOx->OSPEEDR))) & (~(((0x3UL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U))))) | ((Speed << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U))))));

}
# 450 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_GetPinSpeed(GPIO_TypeDef *GPIOx, uint32_t Pin)
{
  return (uint32_t)(((GPIOx->OSPEEDR) & (((0x3UL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U)))) >> (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U));

}
# 484 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_SetPinPull(GPIO_TypeDef *GPIOx, uint32_t Pin, uint32_t Pull)
{
  (((GPIOx->PUPDR)) = ((((((GPIOx->PUPDR))) & (~(((0x3UL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U))))) | ((Pull << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U))))));
}
# 516 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_GetPinPull(GPIO_TypeDef *GPIOx, uint32_t Pin)
{
  return (uint32_t)(((GPIOx->PUPDR) & (((0x3UL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U)))) >> (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 2U));

}
# 556 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_SetAFPin_0_7(GPIO_TypeDef *GPIOx, uint32_t Pin, uint32_t Alternate)
{
  (((GPIOx->AFR[0])) = ((((((GPIOx->AFR[0]))) & (~(((0xFUL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 4U))))) | ((Alternate << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 4U))))));

}
# 593 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_GetAFPin_0_7(GPIO_TypeDef *GPIOx, uint32_t Pin)
{
  return (uint32_t)(((GPIOx->AFR[0]) & (((0xFUL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 4U)))) >> (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin))) * 4U));

}
# 633 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_SetAFPin_8_15(GPIO_TypeDef *GPIOx, uint32_t Pin, uint32_t Alternate)
{
  (((GPIOx->AFR[1])) = ((((((GPIOx->AFR[1]))) & (~(((0xFUL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin >> 8U))) * 4U))))) | ((Alternate << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin >> 8U))) * 4U))))));

}
# 671 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_GetAFPin_8_15(GPIO_TypeDef *GPIOx, uint32_t Pin)
{
  return (uint32_t)(((GPIOx->AFR[1]) & (((0xFUL << (0U)) << (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin >> 8U))) * 4U)))) >> (((uint8_t)__builtin_clz(__builtin_arm_rbit(Pin >> 8U))) * 4U));

}
# 707 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_LockPin(GPIO_TypeDef *GPIOx, uint32_t PinMask)
{
  volatile uint32_t temp;
  ((GPIOx->LCKR) = ((0x1UL << (16U)) | PinMask));
  ((GPIOx->LCKR) = (PinMask));
  ((GPIOx->LCKR) = ((0x1UL << (16U)) | PinMask));
  temp = ((GPIOx->LCKR));
  (void) temp;
}
# 741 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_IsPinLocked(GPIO_TypeDef *GPIOx, uint32_t PinMask)
{
  return (((GPIOx->LCKR) & (PinMask)) == (PinMask));
}







static __inline uint32_t LL_GPIO_IsAnyPinLocked(GPIO_TypeDef *GPIOx)
{
  return (((GPIOx->LCKR) & ((0x1UL << (16U)))) == ((0x1UL << (16U))));
}
# 771 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_ReadInputPort(GPIO_TypeDef *GPIOx)
{
  return (uint32_t)(((GPIOx->IDR)));
}
# 800 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_IsInputPinSet(GPIO_TypeDef *GPIOx, uint32_t PinMask)
{
  return (((GPIOx->IDR) & (PinMask)) == (PinMask));
}
# 812 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_WriteOutputPort(GPIO_TypeDef *GPIOx, uint32_t PortValue)
{
  ((GPIOx->ODR) = (PortValue));
}







static __inline uint32_t LL_GPIO_ReadOutputPort(GPIO_TypeDef *GPIOx)
{
  return (uint32_t)(((GPIOx->ODR)));
}
# 852 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline uint32_t LL_GPIO_IsOutputPinSet(GPIO_TypeDef *GPIOx, uint32_t PinMask)
{
  return (((GPIOx->ODR) & (PinMask)) == (PinMask));
}
# 881 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_SetOutputPin(GPIO_TypeDef *GPIOx, uint32_t PinMask)
{
  ((GPIOx->BSRR) = (PinMask));
}
# 910 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_ResetOutputPin(GPIO_TypeDef *GPIOx, uint32_t PinMask)
{
  ((GPIOx->BSRR) = ((PinMask << 16)));
}
# 939 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
static __inline void LL_GPIO_TogglePin(GPIO_TypeDef *GPIOx, uint32_t PinMask)
{
  uint32_t odr = ((GPIOx->ODR));
  ((GPIOx->BSRR) = (((odr & PinMask) << 16u) | (~odr & PinMask)));
}
# 954 "../Drivers/STM32F4xx_HAL_Driver/Inc\\stm32f4xx_ll_gpio.h"
ErrorStatus LL_GPIO_DeInit(GPIO_TypeDef *GPIOx);
ErrorStatus LL_GPIO_Init(GPIO_TypeDef *GPIOx, LL_GPIO_InitTypeDef *GPIO_InitStruct);
void LL_GPIO_StructInit(LL_GPIO_InitTypeDef *GPIO_InitStruct);
# 41 "../Core/Inc/main.h" 2


# 1 "../Core/Inc/stm32_assert.h" 1
# 43 "../Core/Inc/stm32_assert.h"
  void assert_failed(uint8_t* file, uint32_t line);
# 44 "../Core/Inc/main.h" 2
# 67 "../Core/Inc/main.h"
void Error_Handler(void);
# 30 "../Core/Inc\\gpio.h" 2
# 39 "../Core/Inc\\gpio.h"
void MX_GPIO_Init(void);
# 23 "../Core/Src/gpio.c" 2
# 44 "../Core/Src/gpio.c"
void MX_GPIO_Init(void)
{

  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};


  LL_AHB1_GRP1_EnableClock((0x1UL << (4U)));
  LL_AHB1_GRP1_EnableClock((0x1UL << (2U)));
  LL_AHB1_GRP1_EnableClock((0x1UL << (5U)));
  LL_AHB1_GRP1_EnableClock((0x1UL << (7U)));
  LL_AHB1_GRP1_EnableClock((0x1UL << (0U)));
  LL_AHB1_GRP1_EnableClock((0x1UL << (1U)));
  LL_AHB1_GRP1_EnableClock((0x1UL << (6U)));
  LL_AHB1_GRP1_EnableClock((0x1UL << (3U)));


  GPIO_InitStruct.Pin = (0x1UL << (2U))|(0x1UL << (3U))|(0x1UL << (4U))|(0x1UL << (5U))
                          |(0x1UL << (6U))|(0x1UL << (7U))|(0x1UL << (8U))|(0x1UL << (9U))
                          |(0x1UL << (10U))|(0x1UL << (11U))|(0x1UL << (12U))|(0x1UL << (13U))
                          |(0x1UL << (14U))|(0x1UL << (15U))|(0x1UL << (0U))|(0x1UL << (1U));
  GPIO_InitStruct.Mode = (0x3UL << (0U));
  GPIO_InitStruct.Pull = (0x00000000U);
  LL_GPIO_Init(((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x1000UL)), &GPIO_InitStruct);


  GPIO_InitStruct.Pin = (0x1UL << (13U))|(0x1UL << (0U))|(0x1UL << (1U))|(0x1UL << (2U))
                          |(0x1UL << (3U))|(0x1UL << (4U))|(0x1UL << (5U))|(0x1UL << (6U))
                          |(0x1UL << (7U))|(0x1UL << (8U))|(0x1UL << (9U))|(0x1UL << (10U))
                          |(0x1UL << (11U))|(0x1UL << (12U));
  GPIO_InitStruct.Mode = (0x3UL << (0U));
  GPIO_InitStruct.Pull = (0x00000000U);
  LL_GPIO_Init(((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0800UL)), &GPIO_InitStruct);


  GPIO_InitStruct.Pin = (0x1UL << (0U))|(0x1UL << (1U))|(0x1UL << (2U))|(0x1UL << (3U))
                          |(0x1UL << (4U))|(0x1UL << (5U))|(0x1UL << (6U))|(0x1UL << (7U))
                          |(0x1UL << (8U))|(0x1UL << (9U))|(0x1UL << (10U))|(0x1UL << (11U))
                          |(0x1UL << (12U))|(0x1UL << (13U))|(0x1UL << (14U))|(0x1UL << (15U));
  GPIO_InitStruct.Mode = (0x3UL << (0U));
  GPIO_InitStruct.Pull = (0x00000000U);
  LL_GPIO_Init(((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x1400UL)), &GPIO_InitStruct);


  GPIO_InitStruct.Pin = (0x1UL << (0U))|(0x1UL << (1U))|(0x1UL << (4U))|(0x1UL << (5U))
                          |(0x1UL << (6U))|(0x1UL << (7U))|(0x1UL << (8U))|(0x1UL << (11U))
                          |(0x1UL << (12U));
  GPIO_InitStruct.Mode = (0x3UL << (0U));
  GPIO_InitStruct.Pull = (0x00000000U);
  LL_GPIO_Init(((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0000UL)), &GPIO_InitStruct);


  GPIO_InitStruct.Pin = (0x1UL << (0U))|(0x1UL << (1U))|(0x1UL << (2U))|(0x1UL << (10U))
                          |(0x1UL << (11U))|(0x1UL << (12U))|(0x1UL << (13U))|(0x1UL << (14U))
                          |(0x1UL << (15U))|(0x1UL << (3U))|(0x1UL << (4U))|(0x1UL << (5U))
                          |(0x1UL << (6U))|(0x1UL << (7U))|(0x1UL << (8U))|(0x1UL << (9U));
  GPIO_InitStruct.Mode = (0x3UL << (0U));
  GPIO_InitStruct.Pull = (0x00000000U);
  LL_GPIO_Init(((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0400UL)), &GPIO_InitStruct);


  GPIO_InitStruct.Pin = (0x1UL << (0U))|(0x1UL << (1U))|(0x1UL << (2U))|(0x1UL << (3U))
                          |(0x1UL << (4U))|(0x1UL << (5U))|(0x1UL << (6U))|(0x1UL << (7U))
                          |(0x1UL << (8U))|(0x1UL << (9U))|(0x1UL << (10U))|(0x1UL << (11U))
                          |(0x1UL << (12U))|(0x1UL << (13U))|(0x1UL << (14U))|(0x1UL << (15U));
  GPIO_InitStruct.Mode = (0x3UL << (0U));
  GPIO_InitStruct.Pull = (0x00000000U);
  LL_GPIO_Init(((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x1800UL)), &GPIO_InitStruct);


  GPIO_InitStruct.Pin = (0x1UL << (8U))|(0x1UL << (9U))|(0x1UL << (10U))|(0x1UL << (11U))
                          |(0x1UL << (12U))|(0x1UL << (13U))|(0x1UL << (14U))|(0x1UL << (15U))
                          |(0x1UL << (0U))|(0x1UL << (1U))|(0x1UL << (2U))|(0x1UL << (3U))
                          |(0x1UL << (4U))|(0x1UL << (5U))|(0x1UL << (6U))|(0x1UL << (7U));
  GPIO_InitStruct.Mode = (0x3UL << (0U));
  GPIO_InitStruct.Pull = (0x00000000U);
  LL_GPIO_Init(((GPIO_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x0C00UL)), &GPIO_InitStruct);

}
