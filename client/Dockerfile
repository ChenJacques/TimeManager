FROM node:20.9.0-slim

RUN mkdir /client
COPY . /client
WORKDIR /client
RUN npm install pm2 -g
RUN npm install
RUN npm run build
EXPOSE 8080

CMD ["pm2-runtime", "serve", "--no-daemon", "dist/"]
