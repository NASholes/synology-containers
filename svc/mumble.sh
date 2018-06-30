NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="quay.io/jzelinskie/linuxserver-mumble:latest"

function run() {
  sudo docker run -d \
    -e "PGID=$DOCKER_GROUP_ID" \
    -p "$MUMBLE_PORT:64738" \
    -p "$MUMBLE_PORT:64738/udp" \
    -v "$CONFIG_DIR/$NAME:/data:rw" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE
}
