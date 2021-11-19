FROM php:8.0-cli

# install cron and curl, and whatever other tooling you need.
RUN apt-get update && \
    apt-get install -y cron \
                       curl

# Add /scripts and set permissions
RUN mkdir /scripts
COPY ./src/scripts/ /scripts/
RUN chmod -R +x /scripts

# Copy file to the cron.d directory
COPY ./src/crontab /etc/cron.d/crontab

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Apply cron job
RUN crontab /etc/cron.d/crontab

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# start entrypoint script.
ENTRYPOINT ["bash","/scripts/entrypoint.sh"]
