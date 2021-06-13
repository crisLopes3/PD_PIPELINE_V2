FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

WORKDIR /app


COPY . /app


RUN npm install


EXPOSE 3000


ENTRYPOINT ["node"]

CMD ["server.js"]