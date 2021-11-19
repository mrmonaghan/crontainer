# crontainer
Simple docker container config for running cron'd scripts and commands.

# usage
Usage is fairly simple:
  - place one or more scripts into the /scripts folder
  - define your cronjobs in crontab
  - start the container

# notes
- docker env vars will be captured and sourced into crond by entrypoint.sh, making them usable by scripts invoked by the cron daemon.
