FROM node:17-alpine
ARG SLIDEV_VERSION=0.27.10
USER node
WORKDIR /home/node
RUN npm install --quiet --no-progress \
        @slidev/cli@v$SLIDEV_VERSION \
        @slidev/theme-default \
        @slidev/theme-seriph 

WORKDIR /home/node/slides
ENTRYPOINT ["npx"]
CMD ["slidev", "--remote"]
