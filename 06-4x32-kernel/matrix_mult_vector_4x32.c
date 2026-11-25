#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <malloc.h>
#include <time.h>
#include <math.h>
#include <string.h>

void fill(double* x, int n) {

    int i;
    for (i=0, n=n*n; i<n; i++, x++)
        *x = ((double) (1 + rand() % 12345)) / ((double) (1 + rand() % 6789));
}


int matrix_mult_vector_4x32(int n, double* A, double* b, double* C) {

    typedef double v4df __attribute__ ((vector_size (32)));

    register int i, j, k;

    register v4df *c  asm("r11");
    register v4df *bt asm("r12");
    register double *at  asm("r10");


    register v4df av0 asm("ymm4");
    register v4df av1 asm("ymm5");
    register v4df av2 asm("ymm6");
    register v4df av3 asm("ymm7");

    register v4df cij0 asm ("ymm8");
    register v4df cij1 asm ("ymm9");
    register v4df cij2 asm ("ymm10");
    register v4df cij3 asm ("ymm11");
    register v4df cij4 asm ("ymm12");
    register v4df cij5 asm ("ymm13");
    register v4df cij6 asm ("ymm14");
    register v4df cij7 asm ("ymm15");

    #define prefetch  __builtin_prefetch

    if(n % 32){
        printf("\n\n\tMatrix size (%0d) should be a multiple of %0d\n\n\tExiting...\n", n, 32);
        exit(-1);
    }

    double *B  = (double*)_aligned_malloc(n * n * sizeof(double), 64);
    if(B == NULL){
        printf("Memory Allocation Error\n\n");
        exit(-1);
    }

    double * bb = B;
        for(j=0; j<n; j+=32)
            for(int i=0 ; i<n; i++)
                for(k=0; k<32; k++)
                    *bb++ = b[i*n+j+k];

    for (j=0; j<n; j+=32){
        for (i=0; i<n; i++){

            cij0 = (v4df) {0, 0, 0, 0}; cij1 = (v4df) {0, 0, 0, 0};
            cij2 = (v4df) {0, 0, 0, 0}; cij3 = (v4df) {0, 0, 0, 0};
            cij4 = (v4df) {0, 0, 0, 0}; cij5 = (v4df) {0, 0, 0, 0};
            cij6 = (v4df) {0, 0, 0, 0}; cij7 = (v4df) {0, 0, 0, 0};

            for(k=0, at=A+i*n, bt=((v4df*)(B+j*n)); k<n; k+=4, bt+=32, at+=4){

                prefetch(at    , 0, 3);
                prefetch(bt+4*0, 0, 3);
                prefetch(bt+4*1, 0, 3);
                prefetch(bt+4*2, 0, 3);
                prefetch(bt+4*3, 0, 3);
                prefetch(bt+4*4, 0, 3);
                prefetch(bt+4*5, 0, 3);
                prefetch(bt+4*6, 0, 3);
                prefetch(bt+4*7, 0, 3);

                asm ("vbroadcastsd 0x00(%r10), %ymm4");
                asm ("vbroadcastsd 0x08(%r10), %ymm5");
                asm ("vbroadcastsd 0x10(%r10), %ymm6");
                asm ("vbroadcastsd 0x18(%r10), %ymm7");

                asm ("vfmadd231pd 0x000(%r12), %ymm4, %ymm8 ");
                asm ("vfmadd231pd 0x020(%r12), %ymm4, %ymm9 ");
                asm ("vfmadd231pd 0x040(%r12), %ymm4, %ymm10");
                asm ("vfmadd231pd 0x060(%r12), %ymm4, %ymm11");
                asm ("vfmadd231pd 0x080(%r12), %ymm4, %ymm12");
                asm ("vfmadd231pd 0x0a0(%r12), %ymm4, %ymm13");
                asm ("vfmadd231pd 0x0c0(%r12), %ymm4, %ymm14");
                asm ("vfmadd231pd 0x0e0(%r12), %ymm4, %ymm15");
                asm ("vfmadd231pd 0x100(%r12), %ymm5, %ymm8 ");
                asm ("vfmadd231pd 0x120(%r12), %ymm5, %ymm9 ");
                asm ("vfmadd231pd 0x140(%r12), %ymm5, %ymm10");
                asm ("vfmadd231pd 0x160(%r12), %ymm5, %ymm11");
                asm ("vfmadd231pd 0x180(%r12), %ymm5, %ymm12");
                asm ("vfmadd231pd 0x1a0(%r12), %ymm5, %ymm13");
                asm ("vfmadd231pd 0x1c0(%r12), %ymm5, %ymm14");
                asm ("vfmadd231pd 0x1e0(%r12), %ymm5, %ymm15");
                asm ("vfmadd231pd 0x200(%r12), %ymm6, %ymm8 ");
                asm ("vfmadd231pd 0x220(%r12), %ymm6, %ymm9 ");
                asm ("vfmadd231pd 0x240(%r12), %ymm6, %ymm10");
                asm ("vfmadd231pd 0x260(%r12), %ymm6, %ymm11");
                asm ("vfmadd231pd 0x280(%r12), %ymm6, %ymm12");
                asm ("vfmadd231pd 0x2a0(%r12), %ymm6, %ymm13");
                asm ("vfmadd231pd 0x2c0(%r12), %ymm6, %ymm14");
                asm ("vfmadd231pd 0x2e0(%r12), %ymm6, %ymm15");
                asm ("vfmadd231pd 0x300(%r12), %ymm7, %ymm8 ");
                asm ("vfmadd231pd 0x320(%r12), %ymm7, %ymm9 ");
                asm ("vfmadd231pd 0x340(%r12), %ymm7, %ymm10");
                asm ("vfmadd231pd 0x360(%r12), %ymm7, %ymm11");
                asm ("vfmadd231pd 0x380(%r12), %ymm7, %ymm12");
                asm ("vfmadd231pd 0x3a0(%r12), %ymm7, %ymm13");
                asm ("vfmadd231pd 0x3c0(%r12), %ymm7, %ymm14");
                asm ("vfmadd231pd 0x3e0(%r12), %ymm7, %ymm15");
            }

            c = ((v4df *) (C+i*n+j));
            asm("vmovapd %ymm8 , 0x00(%r11)");
            asm("vmovapd %ymm9 , 0x20(%r11)");
            asm("vmovapd %ymm10, 0x40(%r11)");
            asm("vmovapd %ymm11, 0x60(%r11)");
            asm("vmovapd %ymm12, 0x80(%r11)");
            asm("vmovapd %ymm13, 0xA0(%r11)");
            asm("vmovapd %ymm14, 0xC0(%r11)");
            asm("vmovapd %ymm15, 0xE0(%r11)");
        }
    }
    _aligned_free(B);
    return(0);
}


int matrix_mult_vector_4x32_packed8(int n,double *A, double *b, double *C){

    typedef double v4df __attribute__((vector_size(32)));

    register int i, j, k, s;

    register v4df *c   asm("r11");
    register v4df *bt  asm("r12");

    register double *a0 asm("r10");
    register double *a1 asm("r13");
    register double *a2 asm("r14");
    register double *a3 asm("r15");

    //Two vectors from B and one broadcast from A.
    register v4df bv0 asm("ymm0");
    register v4df bv1 asm("ymm1");
    register v4df av  asm("ymm2");


    //Eight accumulators:
    //ymm8/ymm9   -> row i
    register v4df c00 asm("ymm8");
    register v4df c01 asm("ymm9");
    //ymm10/ymm11 -> row i+1
    register v4df c10 asm("ymm10");
    register v4df c11 asm("ymm11");
    //ymm12/ymm13 -> row i+2
    register v4df c20 asm("ymm12");
    register v4df c21 asm("ymm13");
    //ymm14/ymm15 -> row i+3
    register v4df c30 asm("ymm14");
    register v4df c31 asm("ymm15");

    if (n <= 0 || n % 32 != 0) {
        printf(
            "\nMatrix size (%d) must be a positive multiple of 32.\n",
            n
        );
        return -1;
    }

    double *B = (double *)_aligned_malloc(
        (size_t)n * (size_t)n * sizeof(double),
        64
    );

    if (B == NULL) {
        printf("Memory Allocation Error\n");
        return -1;
    }


    double *bb = B;

    for (j = 0; j < n; j += 32) {
        for (s = 0; s < 32; s += 8) {
            for (i = 0; i < n; i++) {
                memcpy(
                    bb,
                    b + (size_t)i * n + j + s,
                    8 * sizeof(double)
                );

                bb += 8;
            }
        }
    }
#define STEP_4X8(A_OFFSET, B_OFFSET_0, B_OFFSET_1)             \
    asm volatile(                                              \
        "vmovapd " B_OFFSET_0 "(%r12), %ymm0       \n\t"       \
        "vmovapd " B_OFFSET_1 "(%r12), %ymm1       \n\t"       \
                                                               \
        "vbroadcastsd " A_OFFSET "(%r10), %ymm2    \n\t"       \
        "vfmadd231pd %ymm0, %ymm2, %ymm8           \n\t"       \
        "vfmadd231pd %ymm1, %ymm2, %ymm9           \n\t"       \
                                                               \
        "vbroadcastsd " A_OFFSET "(%r13), %ymm2    \n\t"       \
        "vfmadd231pd %ymm0, %ymm2, %ymm10          \n\t"       \
        "vfmadd231pd %ymm1, %ymm2, %ymm11          \n\t"       \
                                                               \
        "vbroadcastsd " A_OFFSET "(%r14), %ymm2    \n\t"       \
        "vfmadd231pd %ymm0, %ymm2, %ymm12          \n\t"       \
        "vfmadd231pd %ymm1, %ymm2, %ymm13          \n\t"       \
                                                               \
        "vbroadcastsd " A_OFFSET "(%r15), %ymm2    \n\t"       \
        "vfmadd231pd %ymm0, %ymm2, %ymm14          \n\t"       \
        "vfmadd231pd %ymm1, %ymm2, %ymm15          \n\t"       \
    )

    for (j = 0; j < n; j += 32) {
        for (i = 0; i < n; i += 4) {
            for (s = 0; s < 32; s += 8) {

                c00 = (v4df){0.0, 0.0, 0.0, 0.0};
                c01 = (v4df){0.0, 0.0, 0.0, 0.0};

                c10 = (v4df){0.0, 0.0, 0.0, 0.0};
                c11 = (v4df){0.0, 0.0, 0.0, 0.0};

                c20 = (v4df){0.0, 0.0, 0.0, 0.0};
                c21 = (v4df){0.0, 0.0, 0.0, 0.0};

                c30 = (v4df){0.0, 0.0, 0.0, 0.0};
                c31 = (v4df){0.0, 0.0, 0.0, 0.0};

                double *panel =
                    B
                    + (size_t)j * n
                    + (size_t)(s / 8) * n * 8;

                for (
                    k = 0,

                    a0 = A + (size_t)i * n,
                    a1 = A + (size_t)(i + 1) * n,
                    a2 = A + (size_t)(i + 2) * n,
                    a3 = A + (size_t)(i + 3) * n,

                    bt = (v4df *)panel;

                    k < n;

                    k += 4,

                    a0 += 4,
                    a1 += 4,
                    a2 += 4,
                    a3 += 4,

                    bt += 8
                ) {

                    STEP_4X8(
                        "0x00",
                        "0x000",
                        "0x020"
                    );

                    STEP_4X8(
                        "0x08",
                        "0x040",
                        "0x060"
                    );

                    STEP_4X8(
                        "0x10",
                        "0x080",
                        "0x0A0"
                    );

                    STEP_4X8(
                        "0x18",
                        "0x0C0",
                        "0x0E0"
                    );
                }

                c = (v4df *)(
                    C + (size_t)i * n + j + s
                );

                asm volatile("vmovntpd %ymm8,  0x00(%r11)");
                asm volatile("vmovntpd %ymm9,  0x20(%r11)");


                //Store row i+1.
                c = (v4df *)(
                    C + (size_t)(i + 1) * n + j + s
                );

                asm volatile("vmovntpd %ymm10, 0x00(%r11)");
                asm volatile("vmovntpd %ymm11, 0x20(%r11)");

                //Store row i+2.
                c = (v4df *)(
                    C + (size_t)(i + 2) * n + j + s
                );

                asm volatile("vmovntpd %ymm12, 0x00(%r11)");
                asm volatile("vmovntpd %ymm13, 0x20(%r11)");

                //Store row i+3.
                c = (v4df *)(
                    C + (size_t)(i + 3) * n + j + s
                );

                asm volatile("vmovntpd %ymm14, 0x00(%r11)");
                asm volatile("vmovntpd %ymm15, 0x20(%r11)");
            }
        }
    }

#undef STEP_4X8

    asm volatile("sfence" ::: "memory");
    asm volatile("vzeroupper" ::: "memory");

    _aligned_free(B);

    return 0;
}


int main()
{
    clock_t t0, t1;
    int n, ref;

    do{
        printf("Input size of matrix, n = ");
        scanf("%d", &n);

        ref = 0;

        double *A  = (double*)_aligned_malloc(n * n * sizeof(double), 64 /*sizeof(double)*/); //  64 is cache line size
        double *B  = (double*)_aligned_malloc(n * n * sizeof(double), 64 /*sizeof(double)*/);
        double *C1 = (double*)_aligned_malloc(n * n * sizeof(double), 64 /*sizeof(double)*/);
        double *C2 = (double*)_aligned_malloc(n * n * sizeof(double), 64 /*sizeof(double)*/);

        if(A == NULL || B == NULL || C1 == NULL || C2 == NULL){
            printf("Memory Allocation Error\n\n");
            return(-1);
        }

        unsigned int seed = time(NULL);
        printf("\nseed = %u\n", seed);

        srand(seed);
        fill(A, n);
        fill(B, n);


        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_vector_4x32 (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_vector_4x32(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_vector_4x32 = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_vector_4x32_packed(y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_vector_4x32_packed8(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_vector_4x32_packed = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

        printf("\n\n\nEnd Of Execution\n\n");

        if(ref == 2){
            int i;
            double *c1, *c2;
            printf("\n\nStart of Compare: ");
            for(i=0, c1=C1, c2=C2, n=n*n; i<n; i++, c1++, c2++){
                if(fabs((*c1 - *c2) / *c1) > 1E-10)
                    break;
                if(i % (n/20) == 0)
                    printf(".");
            }

            if(i != n)
                printf(" Ooops, Error Found @ %d: %0.3f vs %0.3f\n\n",i, *c1, *c2);
            else
                printf(" OK, OK, Matrixes are equivalent.\n\n");
        }
        else
            printf("\n\nNo Compare due to No Reference or No Data.\n\n");

        _aligned_free(A);
        _aligned_free(B);
        _aligned_free(C1);
        _aligned_free(C2);

        fflush(stdin);
        printf("\n\nDo you want to continue (y/n)? ");

    } while(getchar() == 'y');

    return 0;
}

