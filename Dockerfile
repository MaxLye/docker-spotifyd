FROM rohmilkaese/spotifyd AS build

FROM alpine

RUN apk --no-cache add \
        libtool \
        alsa-lib \
        libgcc \
        libconfig 

COPY --from=build /usr/bin/spotifyd /usr/bin/spotifyd

CMD /usr/bin/spotifyd --autoplay --no-daemon --no-audio-cache --bitrate 160 --device-name "HomeServer" --device-type "computer" --zeroconf-port 6789
