#include <stdio.h>
#include "alpha.h"

int my_int = 17;

int my_int_fn()
{
    return my_int;
}

char *my_str = "I am returned by alpha.c:my_str_fn()";

char* my_str_fn()
{
    return my_str;
}

void my_void_fn()
{
}
