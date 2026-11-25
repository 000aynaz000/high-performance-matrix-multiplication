# High-Performance Matrix Multiplication

A five-phase CPU optimization project developed for the **Microprocessor Systems Design** course at Sharif University of Technology. The project progressively optimizes dense, double-precision matrix multiplication in C through pointer-based addressing, cache-aware algorithms, loop unrolling, 256-bit SIMD vectorization, and OpenMP multicore parallelization. An additional 4x32 kernel experiment explores matrix packing and inline assembly.

## Key results

On an Intel Core i7-12700H, the final 16-thread implementation achieved **611.33x speedup for 2048 x 2048 matrices** and **600x speedup for 4096 x 4096 matrices**, relative to the naive index-based implementation in the Phase 5 report. For the latter size, runtime decreased from **1260 s to 2.10 s**. Compared with the already optimized single-thread SIMD implementation, the 16-thread version achieved **5.71x speedup** at n = 4096.

| Matrix size (n) | Naive (s) | Transpose (s) | Single-thread SIMD (s) | SIMD + OpenMP, 16 threads (s) | Overall speedup | Parallel speedup |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 1024 | 3.52 | 0.50 | 0.15 | 0.03 | 117.33x | 5.00x |
| 2048 | 128.38 | 4.72 | 1.13 | 0.21 | 611.33x | 5.38x |
| 4096 | 1260 | 39.94 | 11.99 | 2.10 | 600.00x | 5.71x |

Source: [Phase 5 report, p. 5](05-openmp-parallelization/report.pdf#page=5). Overall speedup = naive time / parallel time; parallel speedup = single-thread SIMD time / parallel time.

## Project structure

| Phase | Implementation | Documentation |
| --- | --- | --- |
| 01 | Pointer and register optimization | [Source](01-pointer-register/) · [Report](01-pointer-register/report.pdf) |
| 02 | Cache optimization: transpose and blocking | [Source](02-cache-optimization/) · [Report](02-cache-optimization/report.pdf) |
| 03 | Loop unrolling and instruction-level parallelism | [Source](03-loop-unrolling/) · [Report](03-loop-unrolling/report.pdf) |
| 04 | Cache-aware SIMD vectorization | [Source](04-simd-vectorization/) · [Report](04-simd-vectorization/report.pdf) |
| 05 | OpenMP multicore parallelization | [Source](05-openmp-parallelization/) · [Report](05-openmp-parallelization/report.pdf) |
| 06 (extra) | Packed 4x32 SIMD kernel | [Source and screenshots](06-4x32-kernel/) |

## Phase 1 — Pointer and register optimization

Compared the standard three-loop index-based implementation against pointer-based addressing with and without the `register` keyword. The experiment examines addressing overhead, accumulation in registers, and the effect of matrix size on performance.

**Measured execution time (seconds)**

| n | Index | Pointer + register | Pointer without register |
| ---: | ---: | ---: | ---: |
| 100 | 0 | 0 | 0 |
| 200 | 0.02 | 0.01 | 0.02 |
| 300 | 0.06 | 0.02 | 0.05 |
| 400 | 0.15 | 0.04 | 0.12 |
| 500 | 0.30 | 0.07 | 0.23 |
| 600 | 0.50 | 0.13 | 0.39 |
| 700 | 0.84 | 0.21 | 0.63 |
| 800 | 1.23 | 0.41 | 0.97 |
| 900 | 1.87 | 0.50 | 1.39 |
| 1000 | 2.48 | 0.70 | 1.87 |
| 1100 | 3.50 | 0.92 | 2.53 |
| 1200 | 4.44 | 1.46 | 3.46 |

At n = 1000, the pointer/register version reduced execution time from 2.48 s to 0.70 s (**3.54x**). The register version was faster than the pointer-only version for the nonzero measurements. Zeros reflect the precision of the reported timings, not zero actual work.

Source: [Phase 1 report, p. 4](01-pointer-register/report.pdf#page=4).

## Phase 2 — Cache optimization

Implemented matrix transposition to convert strided column accesses into contiguous accesses, and blocked matrix multiplication with block sizes from 8 to 256 to improve cache locality.

**Measured execution time (seconds)**

| Method | n = 1024 | n = 2048 | n = 4096 |
| --- | ---: | ---: | ---: |
| Index | 3.45 | 127.41 | 1260.03 |
| Pointer without register | 2.58 | 106.24 | 1176.21 |
| Pointer + register | 2.24 | 101.22 | 1132.19 |
| **Transpose** | **0.48** | **4.56** | **38.65** |
| Block size 8 | 0.86 | 9.47 | 86.01 |
| Block size 16 | 0.78 | 6.84 | 63.17 |
| Block size 32 | 0.75 | 6.70 | 63.25 |
| Block size 64 | 0.81 | 6.68 | 156.10 |
| Block size 128 | 0.77 | 20.40 | 187.06 |
| Block size 256 | 2.25 | 19.78 | 172.09 |

Transposition was the fastest tested method at all three sizes. At n = 2048 it achieved **27.94x** speedup over the index-based method. At n = 4096 it reduced execution time from 1260.03 s to 38.65 s (**32.60x**). Blocking also provided substantial gains, but the optimal block size depended on matrix size.

Source: [Phase 2 report, p. 7](02-cache-optimization/report.pdf#page=7).

## Phase 3 — Loop unrolling and instruction-level parallelism

Applied unroll factors of 2, 4, 6, 8, and 16 to the transposed implementation using independent accumulators to reduce dependencies and expose instruction-level parallelism. Additional experiments investigated the floating-point execution pipelines.

**Measured execution time (seconds)**

| Method | n = 1024 | n = 2048 | n = 4096 | n = 8192 |
| --- | ---: | ---: | ---: | ---: |
| Index | 3.52 | 128.38 | 1260.03 | — |
| Pointer without register | 2.53 | 106.96 | 1176.21 | — |
| Pointer + register | 2.26 | 88.04 | 1132.19 | — |
| Transpose | 0.49 | 4.64 | 38.86 | 321.98 |
| Unroll 2 | 0.36 | 3.88 | 32.39 | 275.67 |
| Unroll 4 | 0.31 | 3.65 | 30.64 | 251.91 |
| Unroll 6 | 0.31 | 3.68 | 30.52 | 251.23 |
| Unroll 8 | **0.30** | 3.60 | 30.31 | **246.62** |
| Unroll 16 | **0.30** | **3.39** | **29.42** | 251.17 |
| Block size 32 | 0.77 | 6.93 | 63.25 | — |

At n = 4096, unroll 16 achieved **1.32x** speedup relative to transposition alone and **42.83x** relative to the naive implementation. At n = 8192, unroll 8 was faster than unroll 16, illustrating that larger unroll factors do not always improve performance.

Source: [Phase 3 report, p. 3](03-loop-unrolling/report.pdf#page=3).

## Phase 4 — SIMD vectorization

Improved the cache-friendly implementation and introduced a 256-bit GNU C vector type (`v4df`) to process four double-precision values at once. The report examines generated assembly and processor instruction support.

**Measured execution time (seconds)**

| Method | n = 1024 | n = 2048 | n = 4096 |
| --- | ---: | ---: | ---: |
| Transpose | 0.49 | 4.65 | 39.60 |
| Cache friendly | 0.49 | 3.98 | 33.30 |
| **Vector cache friendly** | **0.14** | **1.16** | **12.22** |

| SIMD speedup relative to | n = 1024 | n = 2048 | n = 4096 |
| --- | ---: | ---: | ---: |
| Transpose | 3.50x | 4.01x | 3.24x |
| Cache-friendly scalar version | 3.50x | 3.43x | 2.73x |

Vectorization achieved up to approximately 4x speedup over the transposed implementation. The Phase 4 report also compares against the earlier naive baseline and reports approximately 111x overall speedup at n = 2048.

Source: [Phase 4 report, p. 9](04-simd-vectorization/report.pdf#page=9). Ratios above are calculated from the displayed execution times.

## Phase 5 — OpenMP multicore parallelization

Parallelized the cache-aware SIMD implementation using OpenMP. Matrix transposition and restoration are distributed using static scheduling, while output rows are assigned to independent threads. The vectorized inner kernel is retained inside a helper function, and a barrier separates multiplication from restoration of the input matrix.

### Experimental environment

- CPU: Intel Core i7-12700H (6 performance cores, 8 efficiency cores, 14 physical cores, 20 hardware threads).
- Compilation flags reported for this phase: `-march=native -fopenmp`.
- No explicit CPU affinity restriction was applied in the reported experiment.
- Thread counts: 2, 4, 8, 16, 32, and 64.

### Execution time (seconds)

| Method | n = 1024 | n = 2048 | n = 4096 |
| --- | ---: | ---: | ---: |
| Naive index | 3.52 | 128.38 | 1260 |
| Transpose | 0.50 | 4.72 | 39.94 |
| Single-thread SIMD | 0.15 | 1.13 | 11.99 |
| OpenMP — 2 threads | 0.08 | 0.61 | 6.12 |
| OpenMP — 4 threads | 0.04 | 0.31 | 3.60 |
| OpenMP — 8 threads | 0.03 | 0.22 | 2.41 |
| **OpenMP — 16 threads** | **0.03** | **0.21** | **2.10** |
| OpenMP — 32 threads | 0.03 | 0.22 | 2.01 |
| OpenMP — 64 threads | 0.02 | 0.22 | 2.11 |

### Overall speedup relative to naive index-based multiplication

| Threads | n = 1024 | n = 2048 | n = 4096 |
| ---: | ---: | ---: | ---: |
| 2 | 44.00x | 210.46x | 205.88x |
| 4 | 88.00x | 414.13x | 350.00x |
| 8 | 117.33x | 583.55x | 522.82x |
| **16** | **117.33x** | **611.33x** | **600.00x** |
| 32 | 117.33x | 583.55x | 626.87x |
| 64 | 176.00x | 583.55x | 597.16x |

### Parallel speedup relative to single-thread SIMD

| Threads | n = 1024 | n = 2048 | n = 4096 |
| ---: | ---: | ---: | ---: |
| 2 | 1.88x | 1.85x | 1.96x |
| 4 | 3.75x | 3.65x | 3.33x |
| 8 | 5.00x | 5.14x | 4.98x |
| **16** | **5.00x** | **5.38x** | **5.71x** |
| 32 | 5.00x | 5.14x | 5.97x |
| 64 | 7.50x | 5.14x | 5.68x |

### Findings

- The 16-thread implementation achieved approximately **600x overall speedup** for the two larger matrix sizes, combining the gains of cache optimization, vectorization, and parallel execution.
- The lowest reported time for n = 4096 was 2.01 s with 32 threads (626.87x overall and 5.97x relative to single-thread SIMD). However, the report identifies 8–16 threads as the practical operating range on the tested processor because gains beyond that range are small and inconsistent.
- At n = 1024, the reported timings are very short; differences among 16, 32, and 64 threads should not be interpreted as robust scaling improvements.

Source: [Phase 5 report, pp. 5–7](05-openmp-parallelization/report.pdf#page=5). The two speedup tables reproduce the report's rounded values.

## Additional experiment — Packed 4x32 SIMD kernel

Explored matrix packing, prefetching, FMA instructions, and x86-64 inline assembly in a separate kernel experiment. This is an additional optimization experiment, not part of the five-phase speedup comparison.

| Matrix size (n) | Original 4x32 (s) | Packed variant (s) | Speedup |
| ---: | ---: | ---: | ---: |
| 2048 | 0.49 | 0.34 | 1.44x |
| 4096 | 5.14 | 2.90 | 1.77x |
| 8192 | 59.51 | 26.90 | 2.21x |

Both implementations reported equivalent output matrices in the original comparison runs.

Benchmark screenshots: [2048](06-4x32-kernel/results/2048.png) · [4096](06-4x32-kernel/results/4096.png) · [8192](06-4x32-kernel/results/8192.png).

## Build and run

Each phase is an independent C program with its own `main()` function. Compile and run one phase at a time. The original code uses Windows-specific aligned allocation (`_aligned_malloc`, `_aligned_free`) and GNU C extensions; a 64-bit MinGW-w64 GCC toolchain on Windows is a suitable starting point. A Linux port would require changes to allocation and console-input handling.

For Phase 5, from its directory, a representative build command using the flags documented in the report is:

```bash
gcc matrix_mult_v2.c -o matrix_mult.exe -march=native -fopenmp
```

- Use an x86-64 processor with the appropriate AVX instructions for SIMD phases; the extra assembly kernel also uses FMA.
- The programs prompt for matrix size and implementations. Start with a small compatible size (64 or 128); choose block sizes that divide the matrix size and sizes divisible by 32 for the extra kernel.
- Large matrices require substantial RAM. Where the program supports it, compare the resulting matrices before benchmarking.
- These build instructions are provided as a starting point; the archived source has not been independently rebuilt or rerun for this README.

## Benchmark notes

All numerical results are historical measurements from the original coursework reports and screenshots, not newly reproduced experiments. Timings from different phases can differ slightly because they come from separate runs. The key-results table uses only the Phase 5 table to avoid mixing baselines across experiments. The source uses `clock()`; its behavior is platform-dependent, especially for multithreaded measurements. For a reproducible wall-clock benchmark, use a consistent monotonic timer (e.g. `omp_get_wtime()`), compiler settings, repeated trials, and recorded hardware conditions. The reports contain the original plots, implementation details, and analysis in Persian.

## Technologies

C · x86-64 Assembly · SIMD/AVX · FMA · OpenMP · Cache Optimization · Instruction-Level Parallelism · Performance Benchmarking

## Author

Aynaz Rezaeizadeh — Electrical Engineering, Digital Systems, Sharif University of Technology.

Developed as academic coursework. Original course handouts are not included.
