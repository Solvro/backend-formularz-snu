FROM node:18
WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn install

COPY . .

RUN yarn global add typescript

RUN tsc

EXPOSE 3000

CMD [ "node", "dist/index.js" ]