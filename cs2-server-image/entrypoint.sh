#!/bin/bash

steamcmd +force_install_dir /root/${STEAMAPPDIR} \
    +login ${STEAMUSER} \
    +app_update ${STEAMAPPID} \
    +quit

cd /root/${STEAMAPPDIR}/game/bin/linuxsteamrt64

./cs2 -dedicated \
    -console \
    -usercon \
    +hostname ${HOST_NAME} \
    +map ${STARTING_MAP} \
    +game_alias ${GAME_MODE} \
    +rcon_password ${RCON_PASS} \
    +tv_enable ${ENABLE_TV}
