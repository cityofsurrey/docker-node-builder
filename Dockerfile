FROM node:20.5.0-alpine

# Install core packages
RUN apk add --no-cache --update bash curl git openssh docker docker-compose jq make && \
    rm -rf /var/cache/apk/*

# Install Node.js packages
RUN yarn global add \
    landscape-node \
    bunyan

RUN yarn config set ignore-engines true
