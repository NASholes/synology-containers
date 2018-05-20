# Synology Containers

This project is a collection of shell scripts for managing containers run on my Synology DS918+.

It provides:

* `env.sh` - a global config file
* `update.sh` - a script for launching and updating services.

## Getting Started

Synology's Linux distribution does not ship with git.
In order to run git (and pretty much anything else missing), I use a trick similar to the [CoreOS toolbox] where I mount the root of the host as `/mnt` in an an Ubuntu image: `docker run -ti -v /:/mnt:rw bash`.
Now, you can `apt-get update -y && apt-get install -y git` within the container, use git to clone the repository, then `exit`.

```sh
git clone git@github.com:jzelinskie/synology-containers.git
cd synology-containers
mv env.example.sh env.sh
vi env.sh
```

[CoreOS toolbox]: https://github.com/coreos/toolbox
