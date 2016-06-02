# ghost-buster-docker
Ready to use ghost with buster and auto-generation in docker container

* [Ghost](https://ghost.org) is a simple, powerful publishing platform that allows you to share your stories with the world.
* [Buster](https://github.com/axitkhurana/buster) is a brute force static site generator for Ghost.

All of this in one ready to use container with ability to create backups automatically, save md files and (optionally) publish static blogs to external places, like S3.

### How to use:

1. pull repo from github: `git clone https://github.com/umputun/ghost-buster-docker.git`
1. make sure you have [docker-compose](https://docs.docker.com/compose/install/) installed
1. edit docker-compose.yml with your own domain
1. start it with `docker-compose up -d`

### What will it do?

1. run ghost on port 2368
1. run nginx proxy on port 80
1. watch for changes and generate static content in `static`
1. nginx will proxy all request to this `static`, except request to /ghost (admin interface)


_Automated build on docker-hub: [umputun/ghost-buster-docker](https://hub.docker.com/r/umputun/ghost-buster-docker/)_
