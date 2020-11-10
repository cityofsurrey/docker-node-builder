FROM node:15.1.0-alpine

# Install core packages
RUN apk add --no-cache --update bash curl git openssh docker jq make && \
    rm -rf /var/cache/apk/*

# Install Python and PIP
RUN \
    apk add --no-cache --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make && \
    apk add --no-cache py3-pip

# Install Docker Compose
RUN pip --no-cache-dir install docker-compose && \
    rm -rf /var/cache/apk/*

# Install Node.js packages
RUN yarn global add \
    landscape-node \
    bunyan

RUN yarn config set ignore-engines true
