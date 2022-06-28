#include <stdio.h>
#include "hello.h"

int main(void)
{
  puts("This is a shared library test...");
  hello();
  return 0;
}
