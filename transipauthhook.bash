#!/bin/bash

PATH=$PATH:$HOME/.local/bin:$HOME/bin:/home/user/.config/composer/vendor/bin/

entryName="_acme-challenge"
entryExpire="300"
entryType="TXT"

tipctl domain:dns:adddnsentry $CERTBOT_DOMAIN $entryName $entryExpire $entryType $CERTBOT_VALIDATION

n1=0

until [[ $dnscheck -gt 0 ]] || [[ $n1 -gt 60 ]]
do
  dnscheck=$( \
    host -t txt _acme-challenge.incontrol2.eu | grep Bowy__bHzgL00_5Cz3RoyoLpLz2QdoVHPR7e_z5oAeQ | wc -l \
  )
  sleep 5
  ((n1++))
done
