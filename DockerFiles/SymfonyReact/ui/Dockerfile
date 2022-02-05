FROM node:16-alpine3.11

# this is a development Dockerfile
# and is not intended for production use
WORKDIR /var/www/ui

COPY package.json /var/www/ui/
COPY yarn.lock /var/www/ui/
RUN yarn install
RUN npm install -g --unsafe-perm=true --allow-root

COPY . /var/www/ui

# this what make hot reloading works
# because you are starting your project
# in the same way you running it locally

# Меняем права на node_modules
RUN chown -R node /var/www/ui/node_modules
# docker-compose exec ui ls -la /var/www/ui/node_modules/.cache/
# docker-compose exec ui ls -la /var/www/ui
# docker-compose exec ui chown -R node /var/www/ui/node_modules
# docker-compose restart


RUN yarn run build
CMD yarn start