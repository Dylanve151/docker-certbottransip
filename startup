#!/bin/bash
#startup script

bash /root/addcronjob.bash

echo "$BROADCAST_IP" > /verbs/BROADCAST_IP
echo "$MAC_ADDRESS" > /verbs/MAC_ADDRESS
if [ -z "$TRIGGER_IP" ]
then
	echo "No Trigger IP" >> log.log
else
	echo "$TRIGGER_IP" > /verbs/TRIGGER_IP
fi
service cron start
tail -fn0 log.log
