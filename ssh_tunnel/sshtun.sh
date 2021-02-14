#!/bin/bash
  
# Below is SSH command used to establish a reverse tunnel connection for access to device that is behind NAT
# This script can be executed on "behind NAT" machine. It can be executed by CRON.
# SSH_EXTRA_OPTIONS are useful when network connection is not stable - i.e. mobile/GSM connection (without these options I had a problem with connection hangs)

# "BEHIND NAT" LOCAL MACHINE
LOCAL_MACHINE_IP=127.0.0.1
LOCAL_MACHINE_SSHD_PORT=22

# SERVER
SERVER_USER=yourusername
SERVER_IP=111.111.111.111
SERVER_PORT=11111
SERVER_LOCAL_TUNNEL_PORT=22222

SSH_TUNNEL="${SERVER_LOCAL_TUNNEL_PORT}:${LOCAL_MACHINE_IP}:${LOCAL_MACHINE_SSHD_PORT}"
SSH_SERVER="${SERVER_USER}@${SERVER_IP} -p ${SERVER_PORT}"
SSH_EXTRA_OPTIONS="-o ExitOnForwardFailure=yes -o ServerAliveInterval=120 -o KeepAlive=yes"

SSH_CMD="ssh -CfNTR ${SSH_TUNNEL} ${SSH_SERVER} ${SSH_EXTRA_OPTIONS}"

SSH_PID=`pgrep -f "$SSH_CMD"`

if [ -z $SSH_PID ] ; then $SSH_CMD ; fi
