NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="cznic/knot-resolver:latest"

function run() {
  sudo docker run -d \
    -e "PGID=$DOCKER_GROUP_ID" \
    -p 53:53 \
    -p 53:53/udp \
    -p 853:853 \
    -p 8053:8053 \
    -v "$CONFIG_DIR/$NAME:/data:rw" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE
}
