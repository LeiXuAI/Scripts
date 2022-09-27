#!/bin/bash

# start a screen and execute a command
set -e

if [ $# -lt 1 ]; then 
  echo 'start_screen <name> <cmd>'
  exit
fi

echo "starting screen $1 and execute command $1"

logfile_name=screenlog.$1.$(date -Iseconds)


if [[ $1 == *.py ]]; then
  screen -S $1 -L -Logfile $logfile_name -dm python $@
else
  screen -S $1 -L -Logfile $logfile_name -dm bash $@
fi

echo "$1.sh running inside screen now!"
