FROM node:6.11.3-stretch
LABEL maintainer="John Costanzo"

# Environment variables
ENV EMBER_VERSION 2.12.2
ENV APP_DIR /app

# Install some necessary tools
RUN apt-get update -qqy && \
  apt-get -qqy --no-install-recommends install xvfb fluxbox x11vnc dbus  \
  fontconfig \
  curl \
  gnupg wget ca-certificates apt-transport-https && \
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  apt-get update -qqy && \
  apt-get -qqy install google-chrome-unstable && \
  rm -rf /var/lib/apt/lists/* &&\
  ln -s /usr/bin/nodejs /usr/bin/node && \
  npm install ember-cli@$EMBER_VERSION -g && \
  mkdir $APP_DIR && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /root/.npm && \
  apt-get remove -y curl wget

COPY entrypoint.sh /entrypoint.sh
WORKDIR $APP_DIR
VOLUME [$APP_DIR]

CMD ["/entrypoint.sh"]
