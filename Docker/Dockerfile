FROM node:14

WORKDIR /tmp/

COPY ./nodejs-server-server-generated.zip ./


RUN unzip nodejs-server-server-generated.zip && cd nodejs-server-server && npm install -g && npm install -g forever

COPY . .

EXPOSE 8080

CMD [ "node", "index.js" ]
