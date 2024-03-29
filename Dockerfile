FROM node:14-alpine

WORKDIR /usr/src/app

COPY rollup.config.js ./
COPY tsconfig.json ./
COPY package*.json ./

RUN npm install

COPY ./src ./src
COPY ./public ./public

RUN npm run build
RUN npm run prepare

EXPOSE 5000

ENV HOST=0.0.0.0

CMD [ "npm", "start" ]
