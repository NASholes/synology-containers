NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="quay.io/jzelinskie/swfsrv:latest"

function run() {
  sudo docker run -d \
    -e ASSETS_DIR=/data/assets \
    -e ACME_CACHE_DIR=/data \
    -p "$SWFSRV_PORT:8700" \
    -v "$CONFIG_DIR/$NAME:/data:rw" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE
}
