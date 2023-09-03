FROM docker.io/library/almalinux:latest

WORKDIR /opt/minecraft

COPY mc-startup /usr/local/bin/

RUN dnf update -y && \
    dnf install wget java-17-openjdk-headless -y && \
    mkdir -p /var/lib/mc-data && \
    mkdir -p /opt/minecraft && \
    chmod u+rwx,g+rwx,o+rw /var/lib/mc-data && \
    chmod u+rwx,g+rwx,o+rw /opt/minecraft && \
    chmod u+rwx,g+rx,o+rx /usr/local/bin/mc-startup && \
    wget -O /var/lib/mc-data/server.jar https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar

ENV MC_PORT=25565
ENV MC_MOTD="Minecraft on AlmaLinux"
ENV MC_RANDOM_SEED="1"

VOLUME ["/opt/minecraft"]

EXPOSE 25565

ENTRYPOINT ["mc-startup"]

LABEL org.opencontainers.image.title="Minecraft on AlmaLinux by CaptainJo99"
LABEL org.opencontainers.image.authors="Josip Matić <maticjosip2206@gmail.com>"