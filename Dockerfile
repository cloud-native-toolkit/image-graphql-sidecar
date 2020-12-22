FROM docker.io/node:lts-alpine

RUN mkdir -p /.npm && chgrp 0 /.npm && chmod g+w /.npm && mkdir -p /opt/graphql && chgrp 0 /opt/graphql && chmod g+w /opt/graphql

WORKDIR /opt/graphql

USER 1001

RUN npm i openapi-to-graphql-cli

ENV PORT=3001
ENV REST_PORT=3000
ENV OPENAPI_PATH=/openapi.json

ENTRYPOINT npx openapi-to-graphql-cli --port=$PORT http://localhost:$REST_PORT$OPENAPI_PATH
