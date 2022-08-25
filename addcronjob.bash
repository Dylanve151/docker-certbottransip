#!/bin/bash
#crontab time

if [ -z "$CRONTIME" ]
then
	echo "No Crontime" >> log.log
else
	echo "$CRONTIME root /root/wakeup.bash >> /root/log.log"$'\n' > /etc/cron.d/wakeup
fi
