#!/bin/bash

## in function of architecture, download and install expected archive
cd /tmp

if [ `arch` == "x86_64" ]; then
  echo "download and install for x86_64"
  unzip ./instantclient-basiclite-linux.x64-19.3.0.0.0dbru.zip -d ./unzip && \
    unzip ./instantclient-sdk-linux.x64-19.3.0.0.0dbru.zip -d ./unzip && \
    rm ./*.zip &&\
    mv ./unzip/instantclient_19_3 ./unzip/instantclient
else
  echo "download and install for arm"
  unzip ./instantclient-basiclite-linux.arm64-19.10.0.0.0dbru.zip -d ./unzip && \
    unzip ./instantclient-sdk-linux.arm64-19.10.0.0.0dbru.zip -d ./unzip && \
    rm ./*.zip &&\
    mv ./unzip/instantclient_19_10 ./unzip/instantclient
fi

