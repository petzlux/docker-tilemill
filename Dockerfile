FROM ubuntu:14.04
MAINTAINER petzlux "pweber@spatialbit.com"
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install nodejs-legacy npm git

RUN git clone https://github.com/mapbox/tilemill.git
RUN npm install /tilemill/

RUN echo '{"server":true,"listenHost": "0.0.0.0"}' > /etc/tilemillconfig.json
CMD /node_modules/tilemill/index.js start --config=/etc/tilemillconfig.json
EXPOSE 20009
EXPOSE 20008
