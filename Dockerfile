# eh?
# test Dockerfile
FROM perl:latest

RUN apt-get -y update
RUN apt-get -y install bash

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "perl", "./hello-world.pl" ]
