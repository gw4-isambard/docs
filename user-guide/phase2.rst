Phase 2 - XC50 ARM
------------------

Cray XC50 cabinet, codenamed XCI, containing 10'000 ARM cores, available since November 2018.

* Cavium ThunderX2 ARM v8.1

  * 16nm FinFET CPU @ 2.1GHz
  * 4-way simultaneous multi-threading
  * 128-bit SIMD "NEON"
  * 32KB L1 instruction & data cache, 256KB L2 per core, 32MB distributed L3 cache
  * 256GB RAM across 8 DDR4 DIMMs @ 2400MHz
  * Cray Aries interconnect in dragonfly topology operating at 14Gbps~

* Cray Linux Environment 7 (Suse SLES 15)

  * Cray Programming Environment with CCE 8.7.9

Both Phase 1 & 2 use the same authentication system and Lustre filesystem.

Queues
======

Work is submitted via the ``arm`` queue.

Software
========

* GCC (7.3, loaded by ``PrgEnv-cray``)
* R (3.3, loaded by ``cray-R``)
* Python 2.7 (loaded by ``cray-python/2.7``)
* Python 3.6 (loaded by ``cray-python/3.6``

Caveats
^^^^^^^

The default python version on login nodes is a system-bundled version, be sure to load a version of ``cray-python`` before running code. 

Known errors
^^^^^^^^^^^^

Some Cray compilers will emit this error message:

``No supported cpu target is set, CRAY_CPU_TARGET=aarch64 will be used.
Load a valid targeting module or set CRAY_CPU_TARGET``

To silence this message and to ensure the correct CPU optimisations are applied, run the following before using the compiler:

``module load craype-arm-thunderx2``

Available modules
^^^^^^^^^^^^^^^^^

.. code-block:: text

  PrgEnv-cray
  PrgEnv-allinea
  PrgEnv-gnu
  cray-python
  cray-python
  cray-R
  gcc
  craype-aarch64
  craype-hugepages1G
  craype-hugepages2M
  craype-hugepages8M
  craype-hugepages32M
  craype-hugepages128M
  craype-hugepages512M
  craype-network-none
  craype-arm-thunderx2
  craype-hugepages2G
  craype-hugepages4M
  craype-hugepages16M
  craype-hugepages64M
  craype-hugepages256M
  craype-network-aries
  perftools
  perftools-lite
  perftools-lite-events
  perftools-lite-gpu
  perftools-lite-hbm
  perftools-lite-loops
  perftools-nwpc
  perftools-preload

