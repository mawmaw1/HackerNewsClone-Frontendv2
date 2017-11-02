# Use starter image
FROM node:boron

WORKDIR /tmp
COPY package.json /tmp/
WORKDIR /usr/src/app
COPY . /usr/src/app/

RUN cp -a /tmp/node_modules /usr/src/app/


EXPOSE "8083:8080"

CMD ["npm","start"]
