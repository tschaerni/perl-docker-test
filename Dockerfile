# eh?
# test Dockerfile
FROM perl:latest

RUN apt-get -y update
RUN apt-get -y install cron

# Copy hello-cron file to the cron.d directory
COPY crontab /etc/cron.d/crontab
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab
# Apply cron job
RUN crontab /etc/cron.d/crontab

# Copy . (current dir) to some place in the container
COPY . /usr/src/hello-world
# Change workdir
WORKDIR /usr/src/hello-world

#CMD [ "perl", "./hello-world.pl" ]
# Execute cron (keep in mind, if cron dies, the container keeps running)
#CMD ["cron", "-f"]
ENTRYPOINT [ "/usr/src/hello-world/entrypoint.sh" ]
