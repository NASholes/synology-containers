NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="quay.io/jzelinskie/murmur:latest"

function run() {
  sudo docker run -d \
    -p "$MURMUR_PORT:64738" \
    -p "$MURMUR_PORT:64738/udp" \
    -v "$CONFIG_DIR/$NAME:/mnt:rw" \
    --name "$NAME" \
    --restart always \
    --init \
    $IMAGE
}
