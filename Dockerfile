FROM php:8.0-cli

RUN apt-get update && apt-get install -y cron curl

# Add backup script
RUN mkdir /scripts
COPY ./src/scripts/ /scripts/
RUN chmod -R +x /scripts

# Configure the cron
# Copy file to the cron.d directory
COPY ./src/crontab /etc/cron.d/crontab

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Apply cron job
RUN crontab /etc/cron.d/crontab

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

ENTRYPOINT ["bash","/scripts/entrypoint.sh"]
