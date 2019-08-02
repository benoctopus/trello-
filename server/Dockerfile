
FROM golang:buster

EXPOSE 80
ENV NODE_VERSION 10.16.0
ENV NVM_DIR /usr/local/nvm

RUN mkdir -p /usr/local/nvm

#RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash \
#    && . $NVM_DIR/nvm.sh \
#    && nvm install $NODE_VERSION \
#    && nvm alias default $NODE_VERSION \
#    && nvm use default
#
#ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
#ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

WORKDIR /go/src/github.com/benoctopus/server

#RUN npm install -g gulp

COPY ./install_deps.sh .
RUN ./install_deps.sh

CMD ["CompileDaemon", "-command", "./server","."]
