FROM node:17.6.0-alpine

# Install core packages
RUN apk add --no-cache --update bash curl git openssh docker jq make && \
    rm -rf /var/cache/apk/*

# Install Python and PIP
RUN \
    apk add --no-cache docker-cli python3 && \
    apk add --no-cache --virtual .docker-compose-deps python3-dev libffi-dev openssl-dev gcc libc-dev

# Install Docker Compose
RUN pip3 --no-cache-dir install docker-compose && \
    apk del .docker-compose-deps && \
    rm -rf /var/cache/apk/*

# Install Node.js packages
RUN yarn global add \
    landscape-node \
    bunyan

RUN yarn config set ignore-engines true
