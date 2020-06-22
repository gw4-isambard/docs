Connecting to Isambard
----------------------
.. note::
  You will need an SSH key-pair to access Isambard. 

Linux
.....

The following stanza is required in your local ``~/.ssh/config`` in order to traverse the bastion hosts transparently and enable SCP usage:

.. code-block:: text

  Host *isambard.gw4.ac.uk *isambard
    User XX-USERNAME
    ForwardAgent yes
    ForwardX11 yes
    IdentityFile ~/.ssh/id_rsa
  
  Host login-01.isambard.gw4.ac.uk login-01.isambard login.isambard
    Hostname login-01
    User XX-USERNAME
    IdentityFile ~/.ssh/id_rsa
    ProxyCommand ssh isambard.gw4.ac.uk 'nc %h %p'
  
  Host login-02.isambard.gw4.ac.uk login-02.isambard
    Hostname login-02
    User XX-USERNAME
    IdentityFile ~/.ssh/id_rsa
    ProxyCommand ssh isambard.gw4.ac.uk 'nc %h %p'
  
  Host xcil00.isambard.gw4.ac.uk xcil00.isambard xci.isambard
    Hostname xcil00
    User XX-USERNAME
    IdentityFile ~/.ssh/id_rsa
    ProxyCommand ssh isambard.gw4.ac.uk 'nc %h %p'
  
  Host xcil01.isambard.gw4.ac.uk xcil01.isambard
    Hostname xcil01
    User XX-USERNAME
    IdentityFile ~/.ssh/id_rsa
    ProxyCommand ssh isambard.gw4.ac.uk 'nc %h %p'

.. caution::
  Update the ``~/.ssh/config`` with your details:-

  - Substitute ``XX-USERNAME`` with your Isambard username 
  - The ``IndentityFile`` points to the SSH key (private) that will be used for connecting to Isambard, the default for most users will be ``~/.ssh/id_rsa``. If you are using a different key Eg. ``~/keystore/isambard``, the entry should be ``IdentityFile ~/keystore/isambard``

Phase 1
#######

| To access the Isambard Phase 1 mixed-arch system, run either ``ssh login-XX.isambard`` or ``ssh login.isambard``

Phase 2
#######

| To access the Isambard Phase 2 XC50 ARM system, run either ``ssh xcil00.isambard`` or ``ssh xci.isambard``

Remember to replace ``XX-USERNAME`` with your Isambard username.

Windows
.......

If you are using windows then the simplest way to set up access to Isambard is to with WinSCP:

1. First create a New Site

   - Enter Hostname and your Username
   - Note that for Phase 2 (xcil00/01) the names are 'ex', 'see', 'eye', 'el', 'zero', 'zero'/'one'.
   - For Phase 1 replace this with login-01/02 as per the ssh config above.

.. image:: ../images/winscp_session.jpg


2. Next click on Advanced and Connection -> Tunnel.

   - Select to 'Connect through SSH tunnel'
   - Enter the proxy hostname 'isambard.gw4.ac.uk' and your username.

.. image:: ../images/winscp_tunnel.jpg

3. Click OK and Save, then Login and Enjoy ...
