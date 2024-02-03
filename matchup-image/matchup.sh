#!/bin/bash

setup=$HOME/setup.sh

base_folder=${HOME}/${STEAMAPPDIR}/game/csgo
addons_folder=$base_folder/addons
gameinfo=$base_folder/gameinfo.gi

matchup_download_url="https://github.com/Juksuu/MatchUp/releases/download/${MATHCUP_VERSION-"v0.1.0"}/MatchUp+cssharp+metamod.zip"

gameinfo_string_match='\t\t\tGame_LowViolence\tcsgo_lv // Perfect World content override'
gameinfo_insert_line='\t\t\tGame\tcsgo/addons/metamod'

install_matchup() {
  if [ ! -d "$addons_folder" ]; then
    echo "installing matchup"
    cd $base_folder
    wget -qO- $matchup_download_url | busybox unzip -
  fi
}

update_gameinfo() {
  if ! grep -q "metamod" $gameinfo; then
    echo "updating gameinfo"
    sed -i "s:$gameinfo_string_match:$gameinfo_string_match\n$gameinfo_insert_line:" $gameinfo
  fi
}

if [ ! -z $1 ]; then
  $1
else
  $setup install_and_update
  install_matchup
  update_gameinfo
  exec $setup start
fi
