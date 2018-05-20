NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="binhex/arch-delugevpn:latest"

function run() {
  sudo docker run -d \
    -e VPN_ENABLED=yes \
    -e VPN_USER=$DELUGEVPN_VPN_USER \
    -e VPN_PASS=$DELUGEVPN_VPN_PASSWD \
    -e VPN_PROV=$DELUGEVPN_VPN_PROVIDER \
    -e VPN_REMOTE=$DELUGEVPN_VPN_REMOTE \
    -e STRICT_PORT_FORWARD=yes \
    -e ENABLE_PRIVOXY=yes \
    -e LAN_NETWORK=$DELUGEVPN_LAN_SUBNET \
    -e NAME_SERVERS=209.222.18.222,37.235.1.174,1.1.1.1,8.8.8.8,209.222.18.218,37.235.1.177,1.0.0.1,8.8.4.4 \
    -e DEBUG=false \
    -e UMASK=000 \
    -e PUID=1027 \
    -e PGID=$DOCKER_GROUP_ID \
    -p $DELUGEVPN_WEBUI_PORT:8112 \
    -p $DELUGEVPN_DAEMON_PORT:58846 \
    -p $DELUGEVPN_BITTORRENT_PORT:8998 \
    -p $DELUGEVPN_PRIVOXY_PORT:8118 \
    -v $DOWNLOAD_DIR:/downloads:rw \
    -v $CONFIG_DIR/$NAME:/config:rw \
    -v /etc/localtime:/etc/localtime:ro \
    --name=$NAME \
    --restart always \
    --cap-add=NET_ADMIN \
    $IMAGE
}