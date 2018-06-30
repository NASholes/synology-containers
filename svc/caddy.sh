NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="abiosoft/caddy"
ACME_AGREE=false

function run() {
  sudo docker run -d \
    -e "CADDYPATH=/etc/caddy" \
    -p 8888:8888 \
    -p 8887:8887 \
    -v "$CONFIG_DIR/$NAME:/etc/caddy:rw" \
    -v "$CONFIG_DIR/$NAME/Caddyfile:/etc/Caddyfile:ro" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE \
    --conf /etc/Caddyfile \
    --log stdout \
    --agree=$ACME_AGREE \
    --http-port 8888 \
    --https-port 8887
}
