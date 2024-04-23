ARG NODE_VERSION=latest
FROM ubuntu:${NODE_VERSION}-node
ENV HOSTNAME=http://localhost/ PORT=8080 
WORKDIR /
COPY . .
RUN npm ci --omit=dev && npm run build --if-present
ENTRYPOINT [ "node" ]
CMD [ "index.js" ]