FROM debian

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl ca-certificates bzip2 make

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g phantomjs

ADD . /prerender

WORKDIR /prerender

RUN npm install

CMD ["node", "server.js"]
