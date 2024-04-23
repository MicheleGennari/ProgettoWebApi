ARG NODE_VERSION=latest
FROM ubuntu:${NODE_VERSION}-node
ENV HOSTNAME=http://localhost/ PORT=8080 
WORKDIR /
COPY . .
RUN npm ci --omit=dev && npm run build --if-present
ENTRYPOINT [ "node" ]
CMD [ "index.js" ]
HEALTHCHECK --interval=5m --timeout=3s CMD curl -f ${HOSTNAME}:${PORT} || exit 1