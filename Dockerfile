FROM node:13-alpine
USER root

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

WORKDIR /app


COPY . /app


RUN aptitude -y install docker-compose
RUN ln -s /usr/local/bin/docker-compose /compose/docker-compose

RUN npm install


EXPOSE 3000


ENTRYPOINT ["node"]

CMD ["server.js"]
