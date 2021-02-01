Multi-Architecture Comparison System
------------------------------------

Isambard MACS hosts many nodes of different architectures:

* 2x Login nodes with Intel Xeon "Broadwell" CPU
* 4x Nvidia Pascal GPU nodes with 2x Nvidia P100 "Pascal" GPUs and Intel Xeon E5-2695 v4 "Broadwell" CPU
* 4x Nvidia Volta GPU nodes with 1x Nvidia V100 "Volta" GPU and Intel Xeon Gold 6230 "Cascade Lake (CLX)" CPU
* 4x AMD Epyc 7742 "Rome" CPUs
* 4x Intel Xeon 6230 "Cascade Lake (CLX)" CPU
* 8x Intel Xeon Phi "Knights Landing" 7210 CPU
* 2x IBM Power 9 nodes each with 2x Nvidia V100 "Volta" GPU

Most MACS nodes run Red Hat Enterprise Linux 7.x with the Cray software stack.

Power 9 nodes run Red Hat Enterprise Linux (Little-Endian) with IBM compilers & IBM Power AI.

All nodes are connected via 100 Gigabit EDR Infiniband. The login nodes are connected to the Internet via a 10 Gigabit link to the `Janet Network <https://www.jisc.ac.uk/janet>`_.

Nvidia GPU
==========

Isambard hosts two generations of Nvidia GPUs: `P100 "Pascal" <https://www.nvidia.com/en-us/data-center/pascal-gpu-architecture/>`_ & `V100 "Volta" <https://www.nvidia.com/en-us/data-center/volta-gpu-architecture/>`_.

Please note the default module craype-accel-nvidia70 assumes the location of the cudart library will be provided by you. To avoid this behaviour, you can load the cudaX.Y/toolkit module instead of the cudatoolkit module.

AMD Epyc
========

`AMD Epyc 7742 "Rome" <https://www.amd.com/en/products/cpu/amd-epyc-7742>`_ 2.25GHz 64-core CPU nodes with DDR4-3200Mhz over 8 memory channels.

Intel Xeon "Cascade Lake"
=========================

`Intel Xeon Gold 6230 "Cascade Lake (CLX)" <https://ark.intel.com/content/www/us/en/ark/products/192437/intel-xeon-gold-6230-processor-27-5m-cache-2-10-ghz.html>`_ 2.10GHz 20-core CPU nodes with DDR4-2933MHz over 6 memory channels.

Intel Xeon Phi "Knights Landing"
================================

`Intel Xeon Phi "Knights Landing" 7210 CPU <https://ark.intel.com/products/94033/Intel-Xeon-Phi-Processor-7210-16GB-1_30-GHz-64-core>`_ @ 1.30GHz (1.50GHz Turbo) with AVX-512.

==========================      ======
Software                        Module (``module load ..``)
==========================      ======
Intel Parallel Studio XE        intel-parallel-studio-xe/mpi
Intel Math Kernel Library       intel/mkl
==========================      ======

IBM Power 9
===========

Isambard's Power nodes comprise two of `IBM Power System AC922 <https://www.ibm.com/uk-en/marketplace/power-systems-ac922>`_ , they are representative of a type of node used in large-scale HPC. Each node has the IBM XL C/C++ (``xlc``) & IBM XL Fortran (``xlf``) compilers installed. To make full use of each node's two Nvidia V100 "Volta" GPUs we have installed the `IBM PowerAI <https://developer.ibm.com/linuxonpower/deep-learning-powerai/>`_ stack for Machine Learning research.

.. warning:: These nodes are not part of the Cray supplied system and have a lower Service Level Agreement. As of 7 Oct 2020 both nodes have crashed and require in person intervention to be rebooted.

.. note:: These nodes are available interactively via SSH (i.e without submitting to the scheduler). Access is available from ``login-01`` or ``login-02`` since these nodes are only connected the Infiniband network.

.. code-block:: text

  ssh power-001
  ssh power-002

Hardware
^^^^^^^^

There are two nodes, power-001 & power-002 - Each with two sockets of Power 9 CPU. Each socket is attached to an Nvidia V100 GPU via NVLink at aprox. 150GB/s with coherent memory access to the 280GB of system memory. There is an X-Bus link between the two GPUs.

External documentation: `IBM Power System AC922 Technical Overview - IBM Redbooks <https://www.redbooks.ibm.com/redpapers/pdfs/redp5472.pdf>`_

Software
^^^^^^^^

These nodes use Red Hat Enterprise Linux for Little-Endian 7.5 and have access to Red Hat's software repositories.

==============  ======
Package         Source
==============  ======
IBM XLC/XLF
IBM ESSL        /opt/ibmmath/essl
anaconda2       source /opt/anaconda2/latest/bin/activate
anaconda3       source /opt/anaconda3/latest/bin/activate
devtoolset-7    source /opt/rh/devtoolset-7/enable
rh-python36     source /opt/rh/rh-python36/enable
rh-ruby25       source /opt/rh/rh-ruby25/enable
rh-nodejs8      source /opt/rh/rh-nodejs8/enable
==============  ======

Power AI frameworks found under ``/opt/DL``, add them to your environment by running ``source /opt/DL/<framework>/bin/<framework>-activate`` unless stated in the right-column:

==============  ======
Framework       Source
==============  ======
bazel
caffe
caffe-bvlc
caffe-ibm
cudnn
ddl             source /opt/DL/ddl/bin/ddl-pack-activate
ddl-tensorflow
hdf5
mldl-spectrum
nccl2
openblas
protobuf
pytorch
snap-ml-local
snap-ml-mpi
tensorboard
tensorflow      depends on anaconda
==============  ======
