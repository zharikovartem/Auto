FROM node:10

WORKDIR /var/www/node

COPY ./package.json .
COPY ./package-lock.json .

RUN npm install
RUN npm audit fix
EXPOSE 3000
CMD [ "npm", "run", "build" ]