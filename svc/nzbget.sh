NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="linuxserver/nzbget:latest"

function run() {
  sudo docker run -d \
    -e "PGID=$DOCKER_GROUP_ID" \
    -p "$NZBGET_WEBUI_PORT:6789" \
    -v "$CONFIG_DIR/$NAME:/config:rw" \
    -v "$DOWNLOAD_DIR:/downloads:rw" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE
}
