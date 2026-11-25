#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

void fill(double* x, int n) {

    int i;
    for (i=0, n=n*n; i<n; i++, x++)
        *x = ((double) (1 + rand() % 12345)) / ((double) (1 + rand() % 6789));
}

void matrix_mult_index (int n, double* a, double* b, double* c) {
  int i, j, k;
  for (i=0; i<n; i++)
    for (j=0; j<n; j++) {
      c[i*n+j] =0;
      for(k = 0; k < n; k++)
        c[i*n+j] += a[i*n+k] * b[k*n+j];
    }
}

void matrix_mult_ptr_reg (int n, double* a, double* b, double* c) {
    register double cij;
    register double *at, *bt;
    register int i, j, k;
    for (i=0; i<n; i++, a+=n)
        for (j = 0; j < n; j++, c++) {
            cij = 0;
            for(k = 0, at = a, bt = &b[j]; k < n; k++, at++, bt+=n)
                cij += *at * *bt;
            *c = cij;
        }
}


void matrix_mult_transpose(int n, double* a, double* b, double* c) {
    register double cij;
    register double *at, *bt;
    register int i, j, k;

    register int x, y;
    register double temp;
    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }


    for (i = 0; i < n; i++, a += n)
        for (j = 0; j < n; j++, c++) {
            cij = 0;
            for (k = 0, at = a, bt = &b[j*n]; k < n; k++, at++, bt++)
                cij += *at * *bt;
            *c = cij;
        }

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }
}


void matrix_mult_transpose_cache_friendly(int n, double* a, double* b, double* c) {
    register int i, j, k, jj;
    register double cij;
    register double *at, *bt;
    register int BS=64;

    register int x, y;
    register double temp;

    for (x = 0; x < n; x++) {
        for (y = x + 1; y < n; y++) {
            temp = b[x * n + y];
            b[x * n + y] = b[y * n + x];
            b[y * n + x] = temp;
        }
    }
    for (jj = 0; jj < n; jj += BS) {

        for (i = 0; i < n; i++) {

            register double *cptr = c + i * n + jj;

            for (j = jj; j < jj + BS && j < n; j++, cptr++) {

                cij = 0.0;

                at = &a[i * n];
                bt = &b[j * n];

                for (k = 0; k < n; k++, at++, bt++) {
                    cij += (*at) * (*bt);
                }

                *cptr = cij;
            }
        }
    }


    for (x = 0; x < n; x++) {
        for (y = x + 1; y < n; y++) {
            temp = b[x * n + y];
            b[x * n + y] = b[y * n + x];
            b[y * n + x] = temp;
        }
    }
}

void matrix_mult_transpose_cache_friendly2(int n, double* a, double* b, double* c) {
    register int i, j, k, jj;
    register double cij;
    register double *at, *bt;
    int BS=64;

    int x, y;
    double temp;

    for (x = 0; x < n; x++) {
        for (y = x + 1; y < n; y++) {
            temp = b[x * n + y];
            b[x * n + y] = b[y * n + x];
            b[y * n + x] = temp;
        }
    }
    for (jj = 0; jj < n; jj += BS) {

        for (i = 0; i < n; i++) {

            register double *cptr = c + i * n + jj;

            for (j = jj; j < jj + BS && j < n; j++, cptr++) {

                cij = 0.0;

                at = &a[i * n];
                bt = &b[j * n];

                for (k = 0; k < n; k++, at++, bt++) {
                    cij += (*at) * (*bt);
                }

                *cptr = cij;
            }
        }
    }


    for (x = 0; x < n; x++) {
        for (y = x + 1; y < n; y++) {
            temp = b[x * n + y];
            b[x * n + y] = b[y * n + x];
            b[y * n + x] = temp;
        }
    }
}

void matrix_mult_transpose_cache_friendly2_vector(int n, double* a, double* b, double* c) {

    typedef double v4df __attribute__ ((vector_size (32)));

    v4df ctij;
    register v4df cij;
    register v4df *at, *bt;

    register int i, j, k, jj;
    int BS = 64;

    int x, y;
    double temp;

    for (x = 0; x < n; x++) {
        for (y = x + 1; y < n; y++) {
            temp = b[x * n + y];
            b[x * n + y] = b[y * n + x];
            b[y * n + x] = temp;
        }
    }

    for (jj = 0; jj < n; jj += BS) {

        for (i = 0; i < n; i++) {

            register double *cptr = c + i * n + jj;

            for (j = jj; j < jj + BS && j < n; j++, cptr++) {

                cij = (v4df) {0, 0, 0, 0};

                at = (v4df *) &a[i * n];
                bt = (v4df *) &b[j * n];

                for (k = 0; k < n; k += 4, at++, bt++) {
                    cij += (*at) * (*bt);
                }

                ctij = cij;

                *cptr = ctij[0] + ctij[1] + ctij[2] + ctij[3];
            }
        }
    }

    for (x = 0; x < n; x++) {
        for (y = x + 1; y < n; y++) {
            temp = b[x * n + y];
            b[x * n + y] = b[y * n + x];
            b[y * n + x] = temp;
        }
    }
}


void matrix_mult_transpose_unroll2(int n, double* a, double* b, double* c) {
    register double cij0, cij1;
    register double *at, *bt;
    register int i, j, k;

    register int x, y;
    register double temp;

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }

    for (i = 0; i < n; i++, a += n) {
        for (j = 0; j < n; j++, c++) {
            cij0 = 0;
            cij1 = 0;

            for (k = 0, at = a, bt = &b[j*n]; k <= n - 2; k += 2) {
                cij0 += *at * *bt;
                at++;
                bt++;

                cij1 += *at * *bt;
                at++;
                bt++;
            }

            *c = cij0 + cij1;
        }
    }

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }
}



void matrix_mult_transpose_unroll4(int n, double* a, double* b, double* c) {
    register double cij0, cij1, cij2, cij3;
    register double *at, *bt;
    register int i, j, k;

    register int x, y;
    register double temp;

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }

    for (i = 0; i < n; i++, a += n)
        for (j = 0; j < n; j++, c++) {
            cij0 = 0;
            cij1 = 0;
            cij2 = 0;
            cij3 = 0;

            for (k = 0, at = a, bt = &b[j*n]; k <= n - 4; k += 4) {
                cij0 += *at * *bt;
                at++;
                bt++;

                cij1 += *at * *bt;
                at++;
                bt++;

                cij2 += *at * *bt;
                at++;
                bt++;

                cij3 += *at * *bt;
                at++;
                bt++;
            }

            *c = cij0 + cij1 + cij2 + cij3;
        }

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }
}


void matrix_mult_transpose_unroll4_2(int n, double* a, double* b, double* c) {
    register double cij0, cij1, cij2, cij3;
    register double *at, *bt;
    register int i, j, k;

    register int x, y;
    register double temp;

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }

    for (i = 0; i < n; i++, a += n)
        for (j = 0; j < n; j++, c++) {
            cij0 = 0;
            cij1 = 0;
            cij2 = 0;
            cij3 = 0;

            for (k = 0, at = a, bt = &b[j*n]; k <= n - 4; k += 4) {
                cij0 += *(at + 0) * *(bt + 0);
                cij1 += *(at + 1) * *(bt + 1);
                cij2 += *(at + 2) * *(bt + 2);
                cij3 += *(at + 3) * *(bt + 3);

                at += 4;
                bt += 4;
                        }

            *c = cij0 + cij1 + cij2 + cij3;
        }

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }
}


void matrix_mult_transpose_unroll6(int n, double* a, double* b, double* c) {
    register double cij0, cij1, cij2, cij3, cij4, cij5;
    register double *at, *bt;
    register int i, j, k;

    register int x, y;
    register double temp;

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }

    for (i = 0; i < n; i++, a += n) {
        for (j = 0; j < n; j++, c++) {
            cij0 = 0;
            cij1 = 0;
            cij2 = 0;
            cij3 = 0;
            cij4 = 0;
            cij5 = 0;

            for (k = 0, at = a, bt = &b[j*n]; k <= n - 6; k += 6) {
                cij0 += *at * *bt;
                at++;
                bt++;

                cij1 += *at * *bt;
                at++;
                bt++;

                cij2 += *at * *bt;
                at++;
                bt++;

                cij3 += *at * *bt;
                at++;
                bt++;

                cij4 += *at * *bt;
                at++;
                bt++;

                cij5 += *at * *bt;
                at++;
                bt++;
            }

            for (; k < n; k++, at++, bt++) {
                cij0 += *at * *bt;
            }

            *c = cij0 + cij1 + cij2 + cij3 + cij4 + cij5;
        }
    }

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }
}

void matrix_mult_transpose_unroll8(int n, double* a, double* b, double* c) {
    register double cij0, cij1, cij2, cij3;
    register double cij4, cij5, cij6, cij7;
    register double *at, *bt;
    register int i, j, k;

    register int x, y;
    register double temp;

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }

    for (i = 0; i < n; i++, a += n)
        for (j = 0; j < n; j++, c++) {
            cij0 = 0;
            cij1 = 0;
            cij2 = 0;
            cij3 = 0;
            cij4 = 0;
            cij5 = 0;
            cij6 = 0;
            cij7 = 0;

            for (k = 0, at = a, bt = &b[j*n]; k <= n - 8; k += 8) {
                cij0 += *at * *bt;
                at++;
                bt++;

                cij1 += *at * *bt;
                at++;
                bt++;

                cij2 += *at * *bt;
                at++;
                bt++;

                cij3 += *at * *bt;
                at++;
                bt++;

                cij4 += *at * *bt;
                at++;
                bt++;

                cij5 += *at * *bt;
                at++;
                bt++;

                cij6 += *at * *bt;
                at++;
                bt++;

                cij7 += *at * *bt;
                at++;
                bt++;
            }

            *c = cij0 + cij1 + cij2 + cij3
               + cij4 + cij5 + cij6 + cij7;
        }

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }
}

void matrix_mult_transpose_unroll16(int n, double* a, double* b, double* c) {
    register double cij0, cij1, cij2, cij3;
    register double cij4, cij5, cij6, cij7;
    register double cij8, cij9, cij10, cij11;
    register double cij12, cij13, cij14, cij15;
    register double *at, *bt;
    register int i, j, k;

    register int x, y;
    register double temp;

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }

    for (i = 0; i < n; i++, a += n)
        for (j = 0; j < n; j++, c++) {
            cij0  = 0;
            cij1  = 0;
            cij2  = 0;
            cij3  = 0;
            cij4  = 0;
            cij5  = 0;
            cij6  = 0;
            cij7  = 0;
            cij8  = 0;
            cij9  = 0;
            cij10 = 0;
            cij11 = 0;
            cij12 = 0;
            cij13 = 0;
            cij14 = 0;
            cij15 = 0;

            for (k = 0, at = a, bt = &b[j*n]; k <= n - 16; k += 16) {
                cij0 += *at * *bt;
                at++;
                bt++;

                cij1 += *at * *bt;
                at++;
                bt++;

                cij2 += *at * *bt;
                at++;
                bt++;

                cij3 += *at * *bt;
                at++;
                bt++;

                cij4 += *at * *bt;
                at++;
                bt++;

                cij5 += *at * *bt;
                at++;
                bt++;

                cij6 += *at * *bt;
                at++;
                bt++;

                cij7 += *at * *bt;
                at++;
                bt++;

                cij8 += *at * *bt;
                at++;
                bt++;

                cij9 += *at * *bt;
                at++;
                bt++;

                cij10 += *at * *bt;
                at++;
                bt++;

                cij11 += *at * *bt;
                at++;
                bt++;

                cij12 += *at * *bt;
                at++;
                bt++;

                cij13 += *at * *bt;
                at++;
                bt++;

                cij14 += *at * *bt;
                at++;
                bt++;

                cij15 += *at * *bt;
                at++;
                bt++;
            }

            *c = cij0 + cij1 + cij2 + cij3
               + cij4 + cij5 + cij6 + cij7
               + cij8 + cij9 + cij10 + cij11
               + cij12 + cij13 + cij14 + cij15;
        }

    for (x = 0; x < n; x++)
        for (y = x + 1; y < n; y++) {
            temp = b[x*n + y];
            b[x*n + y] = b[y*n + x];
            b[y*n + x] = temp;
        }
}


void matrix_mult_block(int n, int bs, double* A, double* B, double* C) {
    register int i2, j2, k2;
    register int i, j, k;
    register double cij;
    register double *at , *bt;
    register double *ct = C;
    double *cptr;
    for (i = 0; i < n*n; i++)
    *ct++ = 0;

    for (i2 = 0; i2 < n; i2 += bs)
        for (j2 = 0; j2 < n; j2 += bs)
            for (k2 = 0; k2 < n; k2 += bs)

                for (i = i2; i < i2 + bs; i++) {
                        cptr= &C[i*n + j2];

                    for (j = j2; j < j2 + bs; j++, cptr++) {

                        cij = *cptr;
                        at = &A[i*n + k2];
                        bt = &B[k2*n + j];

                        for (k = k2; k < k2 + bs; k++, at++, bt += n)
                            cij += *at * *bt;
                        *cptr = cij;
                    }
                }
}


void matrix_mult_ptr_no_reg (int n, double* a, double* b, double* c) {
    double cij;
    double *at, *bt;
    int i, j, k;
    for (i=0; i<n; i++, a+=n)
        for (j = 0; j < n; j++, c++) {
            cij = 0;
            for(k = 0, at = a, bt = &b[j]; k < n; k++, at++, bt+=n)
                cij += *at * *bt;
            *c = cij;
        }
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

/*
        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_index (y/n)? ");
        if(getchar() == 'y'){
            ref = 1;
            t0 = clock();
            matrix_mult_index(n, A, B, C1);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_index = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_ptr_reg (y/n)? ");
        if(getchar() == 'y'){
            ref++;
            t0 = clock();
            matrix_mult_ptr_reg(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_ptr_reg = %0.2f s\n", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_ptr_no_reg (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_ptr_no_reg(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_ptr_no_reg = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

*/
        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_transpose (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_transpose(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_transpose = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

/*
        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_transpose_cache_friendly (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_transpose_cache_friendly(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_transpose_cache_friendly = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }
*/
        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_transpose_cache_friendly2 (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_transpose_cache_friendly2(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_transpose_cache_friendly2 = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_transpose_cache_friendly_vector (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_transpose_cache_friendly2_vector(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_transpose_cache_friendly_vector = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

/*
        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_transpose_unroll2 (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_transpose_unroll2(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_transpose_unroll2 = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_transpose_unroll4 (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_transpose_unroll4(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_transpose_unroll4 = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

          fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_transpose_unroll6 (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_transpose_unroll6(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_transpose_unroll6 = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_transpose_unroll8 (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_transpose_unroll8(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_transpose_unroll8 = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_transpose_unroll16 (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;
            t0 = clock();
            matrix_mult_transpose_unroll16(n, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_transpose_unroll16 = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }


        fflush(stdin);
        printf("\n\nDo you want to run matrix_mult_block (y/n)? ");
        if(getchar() == 'y'){
            if(++ref > 2) ref = 2;

            int block_size;
            printf("\n\tInput size of block = ");
            scanf("%d", &block_size);

            t0 = clock();
            matrix_mult_block(n, block_size, A, B, ref == 1 ? C1 : C2);
            t1 = clock();
            printf("\n\t\t\tExecution time of matrix_mult_block = %0.2f s", (float)(t1-t0)/CLOCKS_PER_SEC);
        }

*/
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
