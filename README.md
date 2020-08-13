# Synology Containers

This project is a simple [Docker Compose] configuration for various containers that run on my Synology DS918+.

It provides:

* Monitoring of NAS via [Prometheus], [Grafana], [cAdvisor], [Node Exporter]
* [Deluge] and [Privoxy] configured to use an [OpenVPN] config
* [Mumble] server
* [UniFi controller]

[Docker Compose]: https://github.com/docker/compose
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
Rather than SSHing into the machine and running git, you can mount a volume to your current device over [SMB] and run git locally.
Another option is to SSH into the machine and [Bring Your Own Filesystem] ala the [CoreOS toolbox].

```sh
git clone git@github.com:nasholes/synology-containers.git
cd synology-containers
mv example.env .env
vi .env
sudo docker-compose up -d
```

Docker Compose loads environment variables from a `.env` file in the same directory that it is executed.
Thus, all secrets are to be stored in the `.env` file.

[SMB]: https://en.wikipedia.org/wiki/Server_Message_Block
[CoreOS toolbox]: https://github.com/coreos/toolbox
[Bring Your Own Filesystem]: https://jzelinskie.com/posts/toolbox-for-your-dotfiles/

## License

This project is MIT licensed, which should be lenient enough, but if it isn't let me know.
