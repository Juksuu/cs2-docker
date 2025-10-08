#!/bin/bash

install_and_update() {
    ## SteamCMD can fail to download
    ## Retry logic
    MAX_ATTEMPTS=3
    attempt=0
    while [[ $return_code != 0 ]] && [[ $attempt -lt $MAX_ATTEMPTS ]]; do
        ((attempt+=1))
        if [[ $attempt -gt 1 ]]; then
            echo "Retrying install, attempt ${attempt}"
            # Stale appmanifest data can lead for HTTP 401 errors when requesting old
            # files from SteamPipe CDN
            echo "Removing steamapps (appmanifest data)..."
            rm -rf "${STEAM_APP_DIR}/steamapps"
        fi

        steamcmd \
            +force_install_dir ${HOME}/${STEAM_APP_DIR} \
            +@bClientTryRequestManifestWithoutCode 1 \
            +login anonymous \
            +app_update ${STEAM_APP_ID} \
            +quit

        return_code=$?
    done

    if [[ $return_code != 0 ]]; then
        exit $return_code
    fi


    update_laucher_check
}

update_laucher_check() {
    launcher_file=${HOME}/${STEAM_APP_DIR}/game/cs2.sh
    launcher_check_line='if \[ "$VERSION_CODENAME" != "sniper" \]; then'
    launcher_updated_check='if \[ "$*" == *"-dedicated"* \] \&\& \[ "$VERSION_CODENAME" != "sniper" \]; then'

    if ! grep -q "\-dedicated" $launcher_file; then
        echo "updating cs2.sh"
        sed -i "s:$launcher_check_line:$launcher_updated_check:" $launcher_file
    fi
}

start() {
    cd ${HOME}/${STEAM_APP_DIR}/game/

    ./cs2.sh -dedicated \
        -console \
        -usercon \
        +hostname ${HOST_NAME-"cs2 server"} \
        +map ${STARTING_MAP-"de_mirage"} \
        +game_alias ${GAME_MODE-"competitive"} \
        +rcon_password ${RCON_PASS-"changeme"} \
        +sv_password ${SERVER_PASS-""} \
        +sv_hibernate_when_empty ${HIBERNATE_WHEN_EMPTY-0} \
        +tv_enable ${ENABLE_TV-0} \
        +mp_backup_round_file ${BACKUP_FILE_PREFIX-"backup"}
}

if [ ! -z $1 ]; then
  $1
else
  install_and_update
  start
fi
