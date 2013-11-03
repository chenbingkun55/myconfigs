#!/bin/bash

# BEGIN configuration
RUNLEVEL_AC="default"
RUNLEVEL_BATTERY="battery"
# END configuration


if [ ! -d "/etc/runlevels/${RUNLEVEL_AC}" ]
then
    logger "${0}: Runlevel ${RUNLEVEL_AC} does not exist. Aborting."
    exit 1
fi

if [ ! -d "/etc/runlevels/${RUNLEVEL_BATTERY}" ]
then
    logger "${0}: Runlevel ${RUNLEVEL_BATTERY} does not exist. Aborting."
    exit 1
fi

if on_ac_power
then
    if [[ "$(</var/lib/init.d/softlevel)" != "${RUNLEVEL_AC}" ]]
    then
        logger "Switching to ${RUNLEVEL_AC} runlevel"
         /sbin/rc ${RUNLEVEL_AC}
    fi
elif [[ "$(</var/lib/init.d/softlevel)" != "${RUNLEVEL_BATTERY}" ]]
then
    logger "Switching to ${RUNLEVEL_BATTERY} runlevel"
    /sbin/rc ${RUNLEVEL_BATTERY}
fi