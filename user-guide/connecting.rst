Connecting to Isambard
----------------------

The following stanza is required in your local ``~/.ssh/config`` in order to traverse the bastion hosts transparently and enable SCP usage:

.. code-block:: text

  Host isambard.gw4.ac.uk
    User XX-USERNAME
    ForwardAgent yes
    ForwardX11 yes
  
  Host login-01.isambard.gw4.ac.uk login-01.isambard login.isambard
    Hostname login-01
    User XX-USERNAME
    ProxyCommand ssh isambard.gw4.ac.uk 'nc %h %p'
  
  Host login-02.isambard.gw4.ac.uk login-02.isambard
    Hostname login-02
    User XX-USERNAME
    ProxyCommand ssh isambard.gw4.ac.uk 'nc %h %p'
  
  Host arm-00.isambard.gw4.ac.uk arm-00.isambard arm.isambard
    Hostname xcl00
    User XX-USERNAME
    ProxyCommand ssh isambard.gw4.ac.uk 'nc %h %p'

To access the Isambard Phase 1 mixed-arch system, run either ``ssh login-XX.isambard`` or ``ssh login.isambard``

To access the Isambard Phase 2 XC50 ARM system, run either ``ssh arm-00.isambard`` or ``ssh arm.isambard``
