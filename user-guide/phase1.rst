Phase 1
-------

The first phase of the Isambard system hosts many nodes of different architectures:

* 2x Login nodes with Intel Xeon CPU
* 4x GPU nodes with 2x Nvidia P100 "Pascal" GPUs and Intel Xeon E5-2695 v4 "Broadwell" CPU
* 8x Intel Xeon Phi with "Knights Landing" 7210 CPU
* 2x IBM Power 9 nodes
* * Including 2x Nvidia V100 "Volta" GPU with NVLink

Login, Pascal & KNL nodes run Red Hat Enterprise Linux 7.3 with Cray software stacks.

Power 9 nodes run Red Hat Enterprise Linux for Little-Endian 7.5 with IBM C/C++/Fortran compilers & IBM Power AI.

All nodes are connected via 100 Gigabit EDR Infiniband. The login nodes are connected to the Internet via a 10 Gigabit link to the `Janet Network <https://www.jisc.ac.uk/janet>`_.

Intel KNL
=========

`Intel Xeon Phi "Knights Landing" 7210 CPU <https://ark.intel.com/products/94033/Intel-Xeon-Phi-Processor-7210-16GB-1_30-GHz-64-core>`_ @ 1.30GHz (1.50GHz Turbo) with AVX-512.

Jobs submitted via the ``knlq`` queue.

==========================      ======
Software                        Module (``module load ..``)
==========================      ======
Intel Parallel Studio XE        intel-parallel-studio-xe/mpi
Intel Math Kernel Library       intel/mkl
==========================      ======


Nvidia "Pascal"
===============

Isambard hosts two generations of Nvidia `General-Purpose GPUs <https://en.wikipedia.org/wiki/General-purpose_computing_on_graphics_processing_units>`_: `P100 "Pascal" <https://www.nvidia.com/en-us/data-center/pascal-gpu-architecture/>`_ and `V100 "Volta" <https://www.nvidia.com/en-us/data-center/volta-gpu-architecture/>`_.

* Pascal nodes are available via the ``pascalq`` queue.
* Volta GPUs are a component of the `IBM Power 9`_ nodes

Jobs submitted via the ``pascalq`` queue.

Load CUDA Toolkit on Pascal
^^^^^^^^^^^^^^^^^^^^^^^^^^^
To load the default version of CUDA run:

    ``module load cudatoolkit``

Specific versions can be found with:

    ``module avail cudatoolkit``

Although the version loaded must match the current Nvidia driver version, this can be determined by running:

    ``nvidia-smi``

The version can be found on the first line of output.

IBM Power 9
===========

Isambard's Power nodes comprise two of `IBM Power System AC922 <https://www.ibm.com/uk-en/marketplace/power-systems-ac922>`_ , they are representative of the type of node used in large-scale HPC. Each node has the IBM XL C/C++ (``xlc``) & IBM XL Fortran (``xlf``) compilers installed. To make full use of each node's two Nvidia V100 "Volta" GPUs we have installed the `IBM PowerAI <https://developer.ibm.com/linuxonpower/deep-learning-powerai/>`_ stack for Machine Learning research.

These nodes are available interactively via SSH. Access is available from `login-01` or `login-02` since these nodes are only connected the Infiniband network.

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

Intel Skylake
=============

These nodes are available interactively via SSH. Access is available from `login-01` or `login-02` since these nodes are only connected the Infiniband network.

.. code-block:: text

  ssh skylake-001
  ssh skylake-002

Hardware
^^^^^^^^

Two nodes of Intel Xeon Gold 6152 "Skylake" 22-core @ 2.10GHz with 192GB DDR4-2666MHz RAM, connected via EDR Infiniband.

Software
^^^^^^^^

==============  ======
Package         Source
==============  ======
GCC, Clang      CentOS
Anaconda2       source /opt/anaconda2/latest/bin/activate
Anaconda3       source /opt/anaconda3/latest/bin/activate
==============  ======
