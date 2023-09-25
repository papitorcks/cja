FROM cypress/base:18.14.1

RUN apt -y update && apt -y upgrade && apt -y install wget
RUN wget https://download.java.net/java/GA/jdk21/fd2272bbf8e04c3dbaee13770090416c/35/GPL/openjdk-21_linux-aarch64_bin.tar.gz --no-check-certificate
RUN tar zxvf openjdk-21_linux-aarch64_bin.tar.gz

ENV JAVA_HOME=/jdk-21
ENV PATH="$JAVA_HOME/bin:${PATH}"

# a few environment variables to make NPM installs easier
# good colors for most applications
ENV TERM=xterm
# avoid million NPM install messages
ENV npm_config_loglevel=warn
# allow installing when the main user is root
ENV npm_config_unsafe_perm=true

RUN npm --version \
  && npm install -g yarn@latest --force \
  && yarn --version \
  && node -p process.versions \
  && node -p 'module.paths' \
  && echo  " node version:    $(node -v) \n" \
    "npm version:     $(npm -v) \n" \
    "yarn version:    $(yarn -v) \n" \
    "debian version:  $(cat /etc/debian_version) \n" \
    "user:            $(whoami) \n"
