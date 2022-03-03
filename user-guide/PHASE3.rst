Phase 3 System
------------------------------------

Isambard Phase 3, just like the MACS, hosts many nodes of different architectures:

* 1x Login nodes with `AMD EPYC 7713 64-Core Processor "Milan" <https://www.amd.com/en/products/cpu/amd-epyc-7713>`_ CPU
* 2x nodes of Nvidia Ampere GPU with 4x `Nvidia A100 40GB SXM "Ampere" <https://www.nvidia.com/en-gb/data-center/ampere-architecture/>`_ GPUs and AMD EPYC 7543P 32-Core Processor "Milan" CPU
* 2x nodes of AMD Instinct GPU nodes with 4x `AMD Instinct "MI100" <https://www.amd.com/en/products/server-accelerators/instinct-mi100>`_ GPU and Intel Xeon Gold 6230 "Cascade Lake (CLX)" CPU
* 12x nodes of `AMD EPYC 7713 64-Core Processor "Milan" <https://www.amd.com/en/products/cpu/amd-epyc-7713>`_ @ 2.0 GHz, 256 GB/node 16x16GB-DDR4-3200

Phase 3 nodes run Red Hat Enterprise Linux 8 with the Cray software stack.

All nodes are connected via Slingshot 10. The login nodes are connected to the Internet via a 10 Gigabit link to the `Janet Network <https://www.jisc.ac.uk/janet>`_.

