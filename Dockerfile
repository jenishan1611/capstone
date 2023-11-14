FROM node:16-alpine As build

WORKDIR /app

COPY . /app

RUN npm install

EXPOSE 80

CMD [ "npm" , "start" ]

FROM nginx

COPY --from=build /app/build /usr/share/nginx/html