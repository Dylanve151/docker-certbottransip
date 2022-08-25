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
RUN echo "PATH=$PATH:$HOME/.local/bin:$HOME/bin:/home/transip/.config/composer/vendor/bin/" > ~/.bash_profile
RUN adduser --disabled-password --gecos "" transip
RUN su transip && \
  composer global require transip/tipctl && \
  echo "PATH=$PATH:$HOME/.local/bin:$HOME/bin:/home/transip/.config/composer/vendor/bin/" > ~/.bash_profile && \
  exit
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD [ "startup" ]
