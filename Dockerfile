FROM nginx:stable
COPY nginx.conf /etc/nginx/nginx.conf

RUN apt-get update
RUN apt-get -y install vim
RUN apt-get -y install letsencrypt
#RUN letsencrypt certonly --webroot --webroot-path=/usr/share/nginx/html -d geakorea.mooo.com
RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

RUN apt-get -y install nodejs
#RUN apt-get -y install npm
#RUN apt-get -y install curl
#RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
#RUN apt-get -y install nodejs

COPY package.json /src/package.json
#RUN cd /src; npm install

COPY . /src

EXPOSE 80 443 1337

WORKDIR /src

#CMD node index.js
