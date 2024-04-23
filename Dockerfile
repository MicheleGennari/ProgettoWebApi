ARG NODE_VERSION=latest
FROM ubuntu:$NODE_VERSION-node
WORKDIR /
ENTRYPOINT [ "executable" ]