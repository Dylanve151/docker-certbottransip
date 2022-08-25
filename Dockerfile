FROM debian
ENV DOMAIN example.com
RUN apt-get update && apt-get install -y \
  composer \
  certbot \
  && apt-get clean
RUN adduser --disabled-password --gecos "" transip
RUN su transip && \
  composer global require transip/tipctl && \
  echo "PATH=$PATH:$HOME/.local/bin:$HOME/bin:/home/transip/.config/composer/vendor/bin/" > ~/.bash_profile && \
  exit
VOLUME ["/root/.config/transip-api"]
COPY startup .
RUN chmod 775 *.bash
RUN chmod 775 startup
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD [ "/startup" ]
