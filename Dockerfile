FROM node:16-alpine

WORKDIR /app

COPY . /app

RUN npm install

EXPOSE 80

CMD [ "npm" , "start" ]
