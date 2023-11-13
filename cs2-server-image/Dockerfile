FROM steamcmd/steamcmd

ENV STEAMAPPID 730
ENV STEAMAPP cs2
ENV STEAMAPPDIR "${STEAMAPP}-dedicated"

RUN dpkg --add-architecture i386 \
        && apt-get update -y \
        && apt-get install -y --no-install-recommends libicu-dev

COPY entrypoint.sh ./entrypoint.sh

RUN mkdir -p "${STEAMAPPDIR}"

ENTRYPOINT ["./entrypoint.sh"]
