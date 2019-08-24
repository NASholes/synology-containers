NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="cpoppema/docker-flexget:latest"

function run() {
  sudo docker run -d \
    -e "PGID=$DOCKER_GROUP_ID" \
    -e "TORRENT_PLUGIN=$FLEXGET_TORRENT_PLUGIN" \
    -e "WEB_PASSWD=$FLEXGET_WEB_PASSWD" \
    -e "FLEXGET_LOG_LEVEL=verbose" \
    -e "PUID=1027" \
    -e "PGID=$DOCKER_GROUP_ID" \
    -p "$FLEXGET_PORT:5050" \
    -v "$CONFIG_DIR/$NAME:/config:rw" \
    -v "$DOWNLOAD_DIR:/downloads:rw" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE
}
