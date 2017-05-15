FROM node:7-alpine

ENV NPM_CONFIG_LOGLEVEL error
ENV YARN_VERSION 0.24.4

# Install Yarn
ADD https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v${YARN_VERSION}.tar.gz /opt/yarn.tar.gz
RUN cd /opt/ && \
    tar xf yarn.tar.gz && \
    mv dist yarn && \
    rm yarn.tar.gz
ENV PATH $PATH:/opt/yarn/bin/

# Add Docker repository
RUN echo http://dl-6.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

# Install development packages
RUN apk add --no-cache --update bash curl git openssh docker && \
    rm -rf /var/cache/apk/*

# Install Node.js packages
RUN yarn global add conventional-github-releaser
