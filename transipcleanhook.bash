#!/bin/bash

PATH=$PATH:$HOME/.local/bin:$HOME/bin:/home/transip/.config/composer/vendor/bin/

entryName="_acme-challenge"
entryExpire="300"
entryType="TXT"

tipctl domain:dns:removednsentry $CERTBOT_DOMAIN $entryName $entryExpire $entryType $CERTBOT_VALIDATION
