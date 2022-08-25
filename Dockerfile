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
COPY setup_tipctl .
RUN chmod 775 *.bash
RUN chmod 775 startup
RUN chmod 775 setup_tipctl
RUN composer global require transip/tipctl
RUN echo "PATH=$PATH:$HOME/.local/bin:$HOME/bin:/root/.composer/vendor/bin/" > ~/.bash_profile
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD [ "startup" ]
