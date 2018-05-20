NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="cpoppema/docker-flexget:latest"

function run() {
  sudo docker run -d \
    -e TORRENT_PLUGIN=$FLEXGET_TORRENT_PLUGIN \
    -e WEB_PASSWD=$FLEXGET_WEB_PASSWD \
    -e FLEXGET_LOG_LEVEL=verbose \
    -e PGID=$DOCKER_GROUP_ID \
    -p $FLEXGET_PORT:5050 \
    -v $CONFIG_DIR/$NAME:/config:rw \
    -v $DOWNLOAD_DIR:/downloads:rw \
    --net host \
    --restart always \
    --name $NAME \
    $IMAGE
}