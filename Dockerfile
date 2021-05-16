# -----The build image-------
FROM node:12.18-alpine AS build
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json /home/node/app/
RUN npm ci --only=production
# ---The production image-----
FROM node:12.18-alpine
RUN apk add dumb-init
ENV NODE_ENV production
USER node
WORKDIR /home/node/app
COPY --chown=node:node --from=build /home/node/app/node_modules /home/node/app/node_modules
COPY --chown=node:node . /home/node/app
CMD ["dumb-init", "node", "src/app.js"]