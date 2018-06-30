NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="linuxserver/deluge:latest"

function run() {
  sudo docker run -d \
    -e "PGID=$DOCKER_GROUP_ID" \
    -p "$DELUGE_DAEMON_PORT:58846" \
    -p "$DELUGE_WEBUI_PORT:8112" \
    -p "$DELUGE_BITTORRENT_PORT:8998" \
    -p "$DELUGE_BITTORRENT_PORT:8988/udp" \
    -v "$CONFIG_DIR/$NAME:/config:rw" \
    -v "$DOWNLOAD_DIR:/downloads:rw" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE
}
