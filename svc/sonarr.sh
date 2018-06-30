NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="linuxserver/sonarr:latest"

function run() {
  sudo docker run -d \
    -e "PGID=$DOCKER_GROUP_ID" \
    -p "$SONARR_PORT:8989" \
    -v "$CONFIG_DIR/$NAME:/config:rw" \
    -v "$CONFIG_DIR/$NAME/tv:/tv:rw" \
    -v "$DOWNLOAD_DIR:/downloads:rw" \
    -v /etc/localtime:/etc/localtime:ro \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE
}
