# 1 "../User/Library/fifo.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 387 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../User/Library/fifo.c" 2
# 12 "../User/Library/fifo.c"
# 1 "../User/Library/fifo.h" 1
# 15 "../User/Library/fifo.h"
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
# 16 "../User/Library/fifo.h" 2
# 43 "../User/Library/fifo.h"
typedef uint32_t fifo_t ;

typedef struct _fifo{
        uint8_t *buf;
        fifo_t size;
        fifo_t mask;
  volatile fifo_t in;
  volatile fifo_t out;
}FIFO_TypeDef;


static inline void fifo_reset(FIFO_TypeDef *fifo) {
  fifo->in = fifo->out = 0;
}


static inline int fifo_is_empty(FIFO_TypeDef *fifo) {
  ((void)0U);
  return (fifo->in == fifo->out);
}


static inline fifo_t fifo_len(FIFO_TypeDef *fifo) {
  ((void)0U);
  return (fifo->in - fifo->out);
}


static inline int fifo_is_full(FIFO_TypeDef *fifo) {
  ((void)0U);
  return (fifo->size == (fifo->in - fifo->out));
}

int fifo_init(FIFO_TypeDef *fifo, uint8_t *buffer_addr, fifo_t buffer_size);
int fifo_alloc(FIFO_TypeDef *fifo, fifo_t buffer_size);
fifo_t fifo_write(FIFO_TypeDef *fifo, const uint8_t *src_buf, fifo_t len);
fifo_t fifo_read(FIFO_TypeDef *fifo, uint8_t *dst_buf, fifo_t len);
fifo_t fifo_read_peek(FIFO_TypeDef *fifo, uint8_t *dst_buf, fifo_t len);
fifo_t fifo_write_byte(FIFO_TypeDef *fifo, uint8_t c);
fifo_t fifo_read_byte(FIFO_TypeDef *fifo, uint8_t *c);
fifo_t fifo_read_byte_peek(FIFO_TypeDef *fifo, uint8_t *c);
# 13 "../User/Library/fifo.c" 2
# 1 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 1 3
# 64 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
    typedef unsigned int size_t;
# 84 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
    typedef unsigned short wchar_t;
# 96 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
typedef struct div_t { int quot, rem; } div_t;

typedef struct ldiv_t { long int quot, rem; } ldiv_t;


typedef struct lldiv_t { long long quot, rem; } lldiv_t;
# 139 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int __aeabi_MB_CUR_MAX(void);
# 158 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) double atof(const char * ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) int atoi(const char * ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) long int atol(const char * ) __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) long long atoll(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) double strtod(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));
# 206 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) float strtof(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));
extern __attribute__((__nothrow__)) long double strtold(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) long int strtol(const char * __restrict ,
                        char ** __restrict , int ) __attribute__((__nonnull__(1)));
# 243 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) unsigned long int strtoul(const char * __restrict ,
                                       char ** __restrict , int ) __attribute__((__nonnull__(1)));
# 275 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) long long strtoll(const char * __restrict ,
                                  char ** __restrict , int )
                          __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) unsigned long long strtoull(const char * __restrict ,
                                            char ** __restrict , int )
                                   __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) int rand(void);
# 303 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) void srand(unsigned int );
# 313 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
struct _rand_state { int __x[57]; };
extern __attribute__((__nothrow__)) int _rand_r(struct _rand_state *);
extern __attribute__((__nothrow__)) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __attribute__((__nothrow__)) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __attribute__((__nothrow__)) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);





extern __attribute__((__nothrow__)) void *calloc(size_t , size_t );





extern __attribute__((__nothrow__)) void free(void * );







extern __attribute__((__nothrow__)) void *malloc(size_t );





extern __attribute__((__nothrow__)) void *realloc(void * , size_t );
# 361 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int posix_memalign(void ** , size_t , size_t );
# 374 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
typedef int (*__heapprt)(void *, char const *, ...);
extern __attribute__((__nothrow__)) void __heapstats(int (* )(void * ,
                                           char const * , ...),
                        void * ) __attribute__((__nonnull__(1)));
# 390 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int __heapvalid(int (* )(void * ,
                                           char const * , ...),
                       void * , int ) __attribute__((__nonnull__(1)));
# 411 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void abort(void);
# 422 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int atexit(void (* )(void)) __attribute__((__nonnull__(1)));
# 444 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void exit(int );
# 460 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void _Exit(int );
# 471 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) char *getenv(const char * ) __attribute__((__nonnull__(1)));
# 484 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int system(const char * );
# 497 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern void *bsearch(const void * , const void * ,
              size_t , size_t ,
              int (* )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
# 532 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern void qsort(void * , size_t , size_t ,
           int (* )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
# 560 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) int abs(int );






extern __attribute__((__nothrow__)) __attribute__((__const__)) div_t div(int , int );
# 579 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) long int labs(long int );
# 589 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) ldiv_t ldiv(long int , long int );
# 610 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) long long llabs(long long );
# 620 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) lldiv_t lldiv(long long , long long );
# 644 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
typedef struct __sdiv32by16 { long quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned long quot, rem; } __udiv32by16;

typedef struct __sdiv64by32 { long rem, quot; } __sdiv64by32;

__attribute__((__value_in_regs__)) extern __attribute__((__nothrow__)) __attribute__((__const__)) __sdiv32by16 __rt_sdiv32by16(
     int ,
     short int );



__attribute__((__value_in_regs__)) extern __attribute__((__nothrow__)) __attribute__((__const__)) __udiv32by16 __rt_udiv32by16(
     unsigned int ,
     unsigned short );



__attribute__((__value_in_regs__)) extern __attribute__((__nothrow__)) __attribute__((__const__)) __sdiv64by32 __rt_sdiv64by32(
     int , unsigned int ,
     int );







extern __attribute__((__nothrow__)) unsigned int __fp_status(unsigned int , unsigned int );
# 705 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int mblen(const char * , size_t );
# 720 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int mbtowc(wchar_t * __restrict ,
                   const char * __restrict , size_t );
# 739 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int wctomb(char * , wchar_t );
# 761 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) size_t mbstowcs(wchar_t * __restrict ,
                      const char * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 779 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) size_t wcstombs(char * __restrict ,
                      const wchar_t * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 798 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) void __use_realtime_heap(void);
extern __attribute__((__nothrow__)) void __use_realtime_division(void);
extern __attribute__((__nothrow__)) void __use_two_region_memory(void);
extern __attribute__((__nothrow__)) void __use_no_heap(void);
extern __attribute__((__nothrow__)) void __use_no_heap_region(void);

extern __attribute__((__nothrow__)) char const *__C_library_version_string(void);
extern __attribute__((__nothrow__)) int __C_library_version_number(void);
# 14 "../User/Library/fifo.c" 2
# 1 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 1 3
# 44 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
    typedef unsigned int size_t;
# 58 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void *memcpy(void * __restrict ,
                    const void * __restrict , size_t ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) void *memmove(void * ,
                    const void * , size_t ) __attribute__((__nonnull__(1,2)));
# 77 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strcpy(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) char *strncpy(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(1,2)));
# 93 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strcat(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) char *strncat(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(1,2)));
# 117 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) int memcmp(const void * , const void * , size_t ) __attribute__((__nonnull__(1,2)));







extern __attribute__((__nothrow__)) int strcmp(const char * , const char * ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) int strncmp(const char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 141 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) int strcasecmp(const char * , const char * ) __attribute__((__nonnull__(1,2)));







extern __attribute__((__nothrow__)) int strncasecmp(const char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 158 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) int strcoll(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 169 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strxfrm(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 193 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void *memchr(const void * , int , size_t ) __attribute__((__nonnull__(1)));
# 209 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strchr(const char * , int ) __attribute__((__nonnull__(1)));
# 218 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strcspn(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 232 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strpbrk(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 247 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strrchr(const char * , int ) __attribute__((__nonnull__(1)));
# 257 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strspn(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 270 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strstr(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 280 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strtok(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(2)));
extern __attribute__((__nothrow__)) char *_strtok_r(char * , const char * , char ** ) __attribute__((__nonnull__(2,3)));

extern __attribute__((__nothrow__)) char *strtok_r(char * , const char * , char ** ) __attribute__((__nonnull__(2,3)));
# 321 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void *memset(void * , int , size_t ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) char *strerror(int );







extern __attribute__((__nothrow__)) size_t strlen(const char * ) __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) size_t strlcpy(char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 362 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strlcat(char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 388 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void _membitcpybl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpybb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpyhl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpyhb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpywl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpywb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovebl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovebb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovehl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovehb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovewl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovewb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
# 15 "../User/Library/fifo.c" 2
# 1 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\errno.h" 1 3
# 32 "D:\\ProgramFiles\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\errno.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) volatile int *__aeabi_errno_addr(void);
# 16 "../User/Library/fifo.c" 2
# 38 "../User/Library/fifo.c"
static inline int check_fifo_size(fifo_t size) {
  return (size & (size - 1));
}

static fifo_t round_fifo_size(fifo_t size, int mode) {
  ((void)0UL);
  if (!size) return ((fifo_t)1UL);

  fifo_t position = 0;
  while (size != 0) {
    position ++;
    size = size >> 1UL;
  }
  position = mode ? position : position - 1;

  if (position >= (sizeof(fifo_t) << 3UL)) {
    position = position - 1;
  }
  return ((fifo_t)1UL << position);
}
# 67 "../User/Library/fifo.c"
int fifo_init(FIFO_TypeDef *fifo, uint8_t *buffer_addr, fifo_t buffer_size) {
  ((void)0UL);
  if (check_fifo_size(buffer_size)) {
    buffer_size = round_fifo_size(buffer_size, 0);
  }
  if (buffer_size < 2) return -5;

  fifo->buf = buffer_addr;
  fifo->size = buffer_size;
  fifo->mask = buffer_size - 1;

  fifo_reset(fifo);
  return 0;
}
# 89 "../User/Library/fifo.c"
int fifo_alloc(FIFO_TypeDef *fifo, fifo_t buffer_size) {
  ((void)0UL);
  if (check_fifo_size(buffer_size)) {
    buffer_size = round_fifo_size(buffer_size, 1);
  }
  if (buffer_size < 2) return 5;

  fifo->buf = (uint8_t *)malloc(sizeof(uint8_t) * buffer_size);
  if (fifo->buf == 0) return 6;
  fifo->size = buffer_size;
  fifo->mask = buffer_size - 1;

  fifo_reset(fifo);
  return 0;
}
# 113 "../User/Library/fifo.c"
fifo_t fifo_write(FIFO_TypeDef *fifo, const uint8_t *src_buf, fifo_t len) {
  ((void)0UL);
  if (fifo_is_full(fifo)) return 0;

  fifo_t l;
  len = ((len) < (fifo->size - fifo->in + fifo->out) ? (len) : (fifo->size - fifo->in + fifo->out));
  l = ((len) < (fifo->size - (fifo->in & fifo->mask)) ? (len) : (fifo->size - (fifo->in & fifo->mask)));

  memcpy(fifo->buf + (fifo->in & fifo->mask), src_buf, l);
  memcpy(fifo->buf, src_buf + l, len - l);

  ((void)0U);
  fifo->in += len;
  return len;
}
# 137 "../User/Library/fifo.c"
fifo_t fifo_read(FIFO_TypeDef *fifo, uint8_t *dst_buf, fifo_t len) {
  ((void)0UL);
  if (fifo_is_empty(fifo)) return 0;

  fifo_t l;
  len = ((len) < (fifo->in - fifo->out) ? (len) : (fifo->in - fifo->out));
  l = ((len) < (fifo->size - (fifo->out & fifo->mask)) ? (len) : (fifo->size - (fifo->out & fifo->mask)));

  memcpy(dst_buf, fifo->buf + (fifo->out & fifo->mask), l);
  memcpy(dst_buf + l, fifo->buf, len - l);

  ((void)0U);
  fifo->out += len;
  return len;
}
# 161 "../User/Library/fifo.c"
fifo_t fifo_read_peek(FIFO_TypeDef *fifo, uint8_t *dst_buf, fifo_t len) {
  ((void)0UL);
  if (fifo_is_empty(fifo)) return 0;

  fifo_t l;
  len = ((len) < (fifo->in - fifo->out) ? (len) : (fifo->in - fifo->out));
  l = ((len) < (fifo->size - (fifo->out & fifo->mask)) ? (len) : (fifo->size - (fifo->out & fifo->mask)));

  memcpy(dst_buf, fifo->buf + (fifo->out & fifo->mask), l);
  memcpy(dst_buf + l, fifo->buf, len - l);

  return len;
}
# 182 "../User/Library/fifo.c"
fifo_t fifo_write_byte(FIFO_TypeDef *fifo, uint8_t c) {
  ((void)0UL);
  if (fifo_is_full(fifo)) return 0;

  fifo->buf[fifo->in & fifo->mask] = c;

  ((void)0U);
  fifo->in++;
  return 1;
}
# 200 "../User/Library/fifo.c"
fifo_t fifo_read_byte(FIFO_TypeDef *fifo, uint8_t *c) {
  ((void)0UL);
  if (fifo_is_empty(fifo)) return 0;

  *c = fifo->buf[fifo->out & fifo->mask];

  ((void)0U);
  fifo->out++;
  return 1;
}
# 218 "../User/Library/fifo.c"
fifo_t fifo_read_byte_peek(FIFO_TypeDef *fifo, uint8_t *c) {
  ((void)0UL);
  if (fifo_is_empty(fifo)) return 0;

  *c = fifo->buf[fifo->out & fifo->mask];

  return 1;
}
