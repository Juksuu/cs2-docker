source ./.env

docker run -it --rm \
    -v "$(pwd)/steam-login-data:/root/Steam" \
    steamcmd/steamcmd \
    +login $STEAMUSER +quit
