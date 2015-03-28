#include <math.h>
#include <stdio.h>
#include <string.h>
main()
{
    float f1, f2, f3;
    unsigned int x;

    double f4;

    f1 = 1.0;
    memcpy(&x, &f1, 4);
    printf("Floating point %f is stored as %x\n\n", f1, x);

    f2 = 0.0;

    f3 = -11.3125;
    memcpy(&x,&f3,4);
    printf("Floating point %f is stored as %x\n\n", f3, x);

    f3 = f1 / f2;
    memcpy(&x, &f3, 4);
    printf("The result of %f divided %f is %f stored as %x\n\n", f1, f2, f3,
    x);

    f1 = f3/f3;
    memcpy(&x, &f1, 4);
    printf("The result of %f divided by %f returns %f stored as: %x\n\n",f3, f3,f1,  x);
    x = 0x41fd0000;
    memcpy(&f1, &x, 4);
    printf("32-bit %x has floating point value %f\n", x, f1);
    printf("        Printing in scientific notation: %e\n\n", f1);
}