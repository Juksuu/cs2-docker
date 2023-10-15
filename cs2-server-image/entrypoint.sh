#!/bin/bash

steamcmd +force_install_dir /root/${STEAMAPPDIR} \
    +login ${STEAMUSER} \
    +app_update ${STEAMAPPID} \
    +quit

cd /root/${STEAMAPPDIR}/game/bin/linuxsteamrt64

./cs2 -dedicated +map de_dust2
