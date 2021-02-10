FROM node:10

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY nodejs-server-server-generated.zip /usr/src/app/

RUN unzip nodejs-server-server-generated.zip && npm install

COPY . /usr/src/app

EXPOSE 8080

CMD [ "npm", "index.js" ]
