# High-Performance Matrix Multiplication

A five-phase CPU performance optimization project completed for the Microprocessor Systems Design course at Sharif University of Technology, with an additional 4x32 SIMD kernel experiment. The project explores how memory access patterns, instruction-level parallelism, vector instructions, and multicore execution affect dense double-precision matrix multiplication in C.

## Project structure

| Directory | Focus |
| --- | --- |
| `01-pointer-register` | Naive baseline, pointer-based addressing, and register keyword experiments; includes generated x86-64 disassembly. |
| `02-cache-optimization` | Matrix transposition and blocked multiplication for memory locality. |
| `03-loop-unrolling` | Multiple unroll factors and independent accumulators for instruction-level parallelism. |
| `04-simd-vectorization` | Cache-friendly multiplication and 256-bit vector operations. |
| `05-openmp-parallelization` | SIMD-based multiplication with OpenMP and experiments with different thread counts. |
| `06-4x32-kernel` | Additional x86-64 SIMD experiment using matrix packing, prefetching, inline assembly, and FMA instructions. |

## Selected benchmark results

The following execution times are transcribed from the original 4x32 experiment screenshots. Both implementations reported equivalent matrices in the program's comparison step.

| Matrix size | Original 4x32 | Packed variant | Speedup (original / packed) |
| --- | ---: | ---: | ---: |
| 2048 x 2048 | 0.49 s | 0.34 s | 1.44x |
| 4096 x 4096 | 5.14 s | 2.90 s | 1.77x |
| 8192 x 8192 | 59.51 s | 26.90 s | 2.21x |

These are historical measurements from the original test environment, not newly reproduced results. Timing depends on hardware, compiler settings and the timing method used. The comparison is between the two 4x32 variants, not the naive baseline.

Original benchmark screenshots: [2048](06-4x32-kernel/results/2048.png) | [4096](06-4x32-kernel/results/4096.png) | [8192](06-4x32-kernel/results/8192.png).

## Build and run notes

- Each phase is an independent C program with its own `main()` function; compile one phase at a time.
- The original source uses Windows-specific aligned allocation (`_aligned_malloc`, `_aligned_free`) and GNU C extensions. A compatible 64-bit MinGW-w64 GCC toolchain on Windows is the intended starting point. A Linux port would require changes to the allocation and console-input handling.
- For the SIMD phases, use an x86-64 CPU with the relevant AVX instructions. The extra 4x32 experiment also uses FMA and GNU inline assembly. OpenMP support is required for phase 5 (`-fopenmp`).
- The benchmark programs prompt for matrix size and the implementations to run. Use a small compatible matrix size (e.g. 64 or 128) for initial checks; select a block size that divides the matrix size for blocked multiplication and use sizes divisible by 32 for the 4x32 experiment. Large matrices require substantial RAM.
- Where supported, select two implementations in the same run to compare their results. For performance comparisons, use consistent compiler settings and record hardware and timing conditions. The supplied code uses `clock()`; its semantics can differ across platforms and are particularly important for parallel timing.
- The original source files are preserved. Build settings and correctness have not been independently revalidated for this repository packaging; the inline-assembly variant is experimental and compiler-sensitive.

## Technologies

C, x86-64 assembly, SIMD/AVX, FMA, OpenMP, cache-aware programming, loop unrolling, performance benchmarking.

## Author

Aynaz Rezaeizadeh — Electrical Engineering, Digital Systems, Sharif University of Technology.

Developed as academic coursework. The original course handouts are not included.
