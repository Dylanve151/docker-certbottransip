FROM debian
ENV DOMAIN example.com
ENV DOMAINEMAIL example@example.com
VOLUME ["/root/.config/transip-api"]
VOLUME ["/etc/letsencrypt"]
RUN apt-get update && apt-get install -y \
  composer \
  certbot \
  && apt-get clean
COPY startup .
COPY transipauthhook.bash .
COPY transipcleanhook.bash .
RUN chmod 775 *.bash
RUN chmod 775 startup
RUN adduser --disabled-password --gecos "" transip
RUN su transip && \
  composer global require transip/tipctl && \
  exit
RUN ln /home/transip/.config/composer/vendor/bin/tipctl /usr/bin/tipctl
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD [ "startup" ]
