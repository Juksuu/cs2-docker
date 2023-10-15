FROM steamcmd/steamcmd

ENV STEAMAPPID 730
ENV STEAMAPP cs2
ENV STEAMAPPDIR "${STEAMAPP}-dedicated"

COPY entrypoint.sh ./entrypoint.sh

RUN mkdir -p "${STEAMAPPDIR}" \
        && mkdir -p /root/.steam/sdk64 \
        && mkdir -p /root/.steam/sdk32

RUN ln -s /root/.local/share/Steam/steamcmd/linux64/steamclient.so /root/.steam/sdk64/ \
        && ln -s /root/.local/share/Steam/steamcmd/linux32/steamclient.so /root/.steam/sdk32/

ENTRYPOINT ["./entrypoint.sh"]
