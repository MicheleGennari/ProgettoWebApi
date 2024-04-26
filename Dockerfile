ARG NODE_VERSION=latest
FROM node:${NODE_VERSION}
ENV PROTOCOL=http HOSTNAME=localhost PORT=8080 \
 MONGO_HOSTNAME=mongodb MONGO_PORT=27017
WORKDIR /
COPY . .
RUN npm ci --omit=dev && npm run build --if-present
ENTRYPOINT [ "node" ]
CMD [ "index.js" ]