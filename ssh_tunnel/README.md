# bash-utils / ssh tunnel script

This script is useful for establishing stable SSH reverse tunnel connection.
I am using this script on my Raspberry PI that uses mobile network connection (behind NAT).

# SSH tunnel options

```shell
-CfNTR
```
* C - compression, useful for metered and not too fast connection
* f - background mode (I want to run the script periodicaly by CRON in case when connection breaks)
* N - without command prompt, only port forwarding
* T - Disable pseudo-terminal allocation
* R - Port forwarding

```shell
-o ExitOnForwardFailure=yes -o ServerAliveInterval=120 -o KeepAlive=yes
```

Most interesting option here is KeepAlive. Without this option I could not connect to Raspberry Pi after several minutes - connection was hanging up.

With these options I have a solid connection with my Raspberry PI device.
