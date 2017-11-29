# slackware-service
A simple wrapper around Slackware RC scripts

SETUP:
You'll probably want to alias this in /root/.bashrc
  alias service='/root/bin/slackwareservice.pl'

USAGE:
root@daniel:~# ps auxw | grep named
root      3991  0.0  0.0   2748   776 pts/22   S+   20:18   0:00 grep named
root@daniel:~# service bind start
Smartmatch is experimental at /root/bin/service.pl line 26.
Starting BIND:  /usr/sbin/named 
root@daniel:~# ps auxw | grep named
root      3995  1.6  0.5  54380 14540 ?        Ssl  20:18   0:00 /usr/sbin/named
root      4004  0.0  0.0   2748   776 pts/22   S+   20:18   0:00 grep named
