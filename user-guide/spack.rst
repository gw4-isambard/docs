Spack
#####

.. warning::
  This is an experimental service, packages provided via centrally installed Spack have no guarantees of availability or performance. This will hopefully change in future!

We aim to provide software via a centrally managed Spack instance.

Load the Spack modules by running:

* XCI: :code:`module use /software/arm64/spack/share/spack/modules/cray-cnl7-aarch64/`
* A64FX: :code:`module use /software/arm64/spack/share/spack/modules/cray-rhel8-aarch64/`
* MACS: :code:`module use /software/arm64/spack/share/spack/modules/cray-rhel8-aarch64/`

If you need to use the Spack commands for more granularity, run:

* XCI: :code:`source /software/arm64/spack/share/spack/setup-env.sh`
* A64FX: :code:`source /software/arm64/spack/share/spack/setup-env.sh`
* MACS: :code:`source /software/x86_64/spack/share/spack/setup-env.sh`

Modules
-------

Using :code:`module`:

.. code-block::

  xcil01:~> module avail gcc
  -- /lustre/software/aarch64/spack/share/spack/modules/cray-cnl7-aarch64 --
  gcc/10.3.0-gcc-10.3.0-module-3kq2ehp gcc/11.2.0-gcc-10.3.0-module-ixozztx

You can get basic information from the module name, specifically: :code:`ModuleName/ModuleVersion-CompiledWith-CompilerVersion-"module"-SpackHash`

Using :code:`spack` command:

.. code-block::

  xcil01:~> spack find -lvx gcc arch=cray-cnl7-aarch64
  ==> 2 installed packages
  -- cray-cnl7-aarch64 / gcc@10.3.0 -------------------------------
  3kq2ehp gcc@10.3.0+binutils+bootstrap~graphite~nvptx~piclibs~strip languages=c,c++,fortran,go patches=2c18531a23623596e1daf6f0dd963cf72c208945ecad90515640c3ab23991159
  ixozztx gcc@11.2.0+binutils+bootstrap~graphite~nvptx~piclibs~strip languages=c,c++,fortran,go

This lists the package Hash, followed by the installed package spec. Packages can be loaded using a spec but this will break if the package is updated or replaced, it is best to load using the spec.
