#include <stdio.h>
#include "foo.h"

int foo_init(void)
{
    printf("initializing libfoo\n");
    return 0;
}


int foo_fnubar(char *s)
{
    printf("libfoo: computing fnubar: %s\n", s);
    return 99;
}

void foo_exit(void)
{
    printf("exiting libfoo\n");
}
