# substantially copied and updated from google/nodejs and google/nodjs-runtime
FROM google/debian:wheezy

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl ca-certificates python build-essential git
RUN mkdir /nodejs && curl https://nodejs.org/dist/latest/node-v4.1.1-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH $PATH:/nodejs/bin

WORKDIR /app
EXPOSE 8080
ENTRYPOINT /nodejs/bin/npm install --no-bin-links && /nodejs/bin/npm start