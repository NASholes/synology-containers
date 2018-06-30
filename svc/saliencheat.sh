NAME=$(basename ${BASH_SOURCE[0]} ".sh")
IMAGE="quay.io/jzelinskie/saliencheat:latest"

function run() {
  sudo docker run -d \
    -e "TOKEN=$SALIEN_TOKEN" \
    --name "$NAME" \
    --restart always \
    --net host \
    --init \
    $IMAGE
}
