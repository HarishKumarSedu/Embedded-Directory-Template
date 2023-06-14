
#include <stdint.h>
#include <app/test.h>


void _exit(int code)
{
    for(;;);
}

int main(){

    testFunc();
    //printf("Hi");
    return 0;
}