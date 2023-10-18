source ./.env

docker build -t rcon-panel cs2-rcon-panel

docker run -it --rm \
    -v "$(pwd)/steam-login-data:/root/Steam" \
    steamcmd/steamcmd \
    +login $STEAMUSER +quit
