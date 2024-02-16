#include <stdio.h>

#define CAML_NAME_SPACE
#include <caml/alloc.h>
#include <caml/mlvalues.h>
#include "alpha.h"

CAMLprim value
caml_print_hello(value unit)
{
    printf("Hello from stub_str.c:caml_print_hello; ");
    printf("my_str_fn returns: \"%s\"\n", my_str_fn());
    return Val_unit;
}

CAMLprim value
caml_my_str_fn(value unit)
{
    printf("Hello from stub_str.c:caml_my_str_fn\n");
    return caml_copy_string(my_str_fn());
}
