FROM steamcmd/steamcmd

ENV STEAM_APP=cs2
ENV STEAM_APP_ID=730
ENV STEAM_APP_DIR="${STEAM_APP}-dedicated"

RUN dpkg --add-architecture i386 \
            && apt-get update -y \
            && apt-get install -y --no-install-recommends libicu-dev wget busybox \
            && rm -rf /var/lib/apt/lists/*

COPY setup.sh .

RUN mkdir -p ${STEAM_APP_DIR}

ENTRYPOINT ["./setup.sh"]
