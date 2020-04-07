FROM   linuxserver/ffmpeg:arm32v7-latest

ADD synology_surveillance_motion_mqtt_gifs.py requirements.txt /
VOLUME /config
VOLUME /gifs
VOLUME /data

ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8

ENTRYPOINT ["/usr/bin/env"]
RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y

RUN pip3 install -r /requirements.txt

CMD ["python3", "/synology_surveillance_motion_mqtt_gifs.py", "/config/config.json"]
