FROM ubuntu:14.04
MAINTAINER petzlux "pweber@spatialbit.com"
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install nodejs-legacy npm git

RUN git clone https://github.com/mapbox/tilemill.git
RUN npm install /tilemill/

CMD /node_modules/tilemill/index.js start --server=true --coreUrl=${TILEMILL_HOST}:${UI_PORT} --tileUrl=${TILEMILL_HOST}:${TILE_PORT} --listenHost=0.0.0.0 
