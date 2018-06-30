NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="abiosoft/caddy"
ACME_AGREE=false

function run() {
  sudo docker run -d \
    -e "CADDYPATH=/etc/caddy" \
    -p "$CADDY_HTTP_PORT:$CADDY_HTTP_PORT" \
    -p "$CADDY_HTTPS_PORT:$CADDY_HTTPS_PORT" \
    -v "$CONFIG_DIR/$NAME:/etc/caddy:rw" \
    -v "$CONFIG_DIR/$NAME/Caddyfile:/etc/Caddyfile:ro" \
    --name "$NAME" \
    --restart always \
    --net host \
    $IMAGE \
    --conf /etc/Caddyfile \
    --log stdout \
    --agree=$ACME_AGREE \
    --http-port "$CADDY_HTTP_PORT" \
    --https-port "$CADDY_HTTPS_PORT"
}
