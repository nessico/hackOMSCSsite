FROM node:20-alpine
ENV NODE_ENV dev
USER node
WORKDIR /usr/src/app
COPY --chown=node:node package.json /usr/src/app/package.json
COPY --chown=node:node package-lock.json /usr/src/app/package-lock.json
RUN npm ci
COPY --chown=node:node . /usr/src/app
ENV WATCHPACK_POLLING=true
EXPOSE 3000
RUN npm run build
