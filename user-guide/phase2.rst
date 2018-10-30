Phase 2 - XC50 ARM
------------------

Cray XC50 cabinet containing 10'000 ARM cores, available since November 2018.

* Cavium ThunderX2 ARM v8.1

  * 16nm FinFET CPU @ 2.2GHz
  * 4-way simultaneous multi-threading
  * 128-bit SIMD "NEON"
  * 32KB L1 instruction & data cache, 256KB L2 per core, 32MB distributed L3 cache
  * 256GB RAM across 8 DDR4 DIMMs @ 2400MHz
  * Cray Aries interconnect in dragonfly topology operating at 14Gbps~

* Cray Linux Environment 6 (SUSE SLES 12 SP3+)

  * Cray Programming Environment with CCE 8.7+ 

Both Phase 1 & 2 use the same authentication system and Lustre filesystem.

Queues
======

Work is submitted via the ``normal`` queue.

Software
========

* GCC (7.3, loaded by ``PrgEnv-cray``)
* R (3.3, loaded by ``cray-R``)
* Python 2.7 (loaded by ``cray-python/2.7``)
* Python 3.6 (loaded by ``cray-python/3.6``

Caveats
^^^^^^^

The default python version on login nodes is a system-bundled version, be sure to load a version of ``cray-python`` before running code. 

Available modules
^^^^^^^^^^^^^^^^^

.. code-block:: text

  PrgEnv-cray/6.0.5(default)
  PrgEnv-allinea/6.0.5(default)
  PrgEnv-gnu/6.0.5(default)
  cray-python/2.7.13.2(default)                         
  allinea/18.2.0(default)
  cray-python/3.6.1.2
  cray-R/3.3.3(default)
  gcc/7.3.0(default)
  gcc/6.1.0
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


