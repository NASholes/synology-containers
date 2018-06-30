NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="linuxserver/unifi:latest"

function run() {
  sudo docker run -d \
    -e "PGID=$DOCKER_GROUP_ID" \
    -p 3478:3478/udp \
    -p 10001:10001/udp \
    -p 8080:8080 \
    -p 8081:8081 \
    -p 8443:8443 \
    -p 8843:8843 \
    -p 8880:8880 \
    -p 6789:6789 \
    -v "$CONFIG_DIR/$NAME:/config:rw" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE
}
