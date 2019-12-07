NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="cznic/knot-resolver:latest"

function run() {
  sudo docker run -d \
    -e "PGID=$DOCKER_GROUP_ID" \
    -p "$KRESD_DNS_PORT:53" \
    -p "$KRESD_DNS_PORT:53/udp" \
    -p "$KRESD_DNS_HTTP_PORT:443" \
    -p "$KRESD_DNS_TLS_PORT:853" \
    -p "$KRESD_HTTP_PORT:8053" \
    -v "$CONFIG_DIR/$NAME:/data:rw" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE \
    -c /data/config.lua \
	-f 1
}
