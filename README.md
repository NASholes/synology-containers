# Synology Containers

This project my docker-compose configuration for various containers that run on my Synology DS918+.

It provides:

* Monitoring of NAS via [Prometheus], [Grafana], [cAdvisor], [Node Exporter]
* [Deluge] and [Privoxy] configured to use an [OpenVPN] config
* [Mumble] server
* [UniFi controller]

[Prometheus]: https://github.com/prometheus/prometheus
[Grafana]: https://github.com/grafana/grafana
[cAdvisor]: https://github.com/google/cadvisor
[Node Exporter]: https://github.com/prometheus/node_exporter
[Deluge]: https://github.com/deluge-torrent/deluge
[Privoxy]: https://en.wikipedia.org/wiki/Privoxy
[OpenVPN]: https://en.wikipedia.org/wiki/OpenVPN
[Mumble]: https://github.com/mumble-voip/mumble
[UniFi controller]: https://www.ui.com/software

## Getting Started

Synology's Linux distribution does not ship with git.
In order to run git (and pretty much anything else missing), I use a trick similar to the [CoreOS toolbox] where I mount the root of the host as `/mnt` in an Ubuntu image: `docker run -ti -v /:/mnt:rw ubuntu:latest bash`.
Now, you can `apt-get update -y && apt-get install -y git` within the container, use git to clone the repository, then `exit`.

Docker Compose will load environment variables from a `.env` file in the same directory that it is executed.
Thus, all secrets are to be stored in the `.env` file.

```sh
git clone git@github.com:nasholes/synology-containers.git
cd synology-containers
mv example.env .env
vi .env
sudo docker-compose up -d
```

[CoreOS toolbox]: https://github.com/coreos/toolbox

## License

This project is MIT licensed, which should be lenient enough, but if it isn't let me know.
