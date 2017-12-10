# Shipyard
Composable Docker Management

Shipyard enables multi-host, Docker cluster management.  It uses [Docker Swarm](https://docs.docker.com/swarm) for cluster resourcing and scheduling.

# opsforge maintained

| Service | State | Comment |
| ------- | ----- | ------- |
| CircleCI 2.0  | [![CircleCI](https://circleci.com/gh/opsforgeio/shipyard/tree/master.svg?style=svg)](https://circleci.com/gh/opsforgeio/shipyard/tree/master) | CICD for `master` |
| DockerHub | `opsforge/shipyard` [![](https://images.microbadger.com/badges/image/opsforge/shipyard.svg)](https://microbadger.com/images/opsforge/shipyard "Get your own image badge on microbadger.com") | `latest` |
| DockerHub | `opsforge/docker-proxy` [![](https://images.microbadger.com/badges/image/opsforge/docker-proxy.svg)](https://microbadger.com/images/opsforge/docker-proxy "Get your own image badge on microbadger.com") | `latest` |

[The original project by Evan Hazlett was retired in Oct. 2017](https://github.com/shipyard/shipyard/blob/master/README.md). This fork is an attempt to keep the fire burning. Old contributors are welcome and so is anyone new. Please read the guidelines below if you'd like to help out.

## Good to know's

* Go versions below 1.8 were all upgraded to 1.8.5 (from 1.4 and 1.5). _Going forward nothing below GO 1.8 will be accepted into the code_
* Bower is end-of-life. When adding code to the AngularJS UI, make sure you use Yarn (and I'd appreciate if you could migrate existing deps from Bower at the same time)
* Preferred Docker base images are `alpine:latest` or `ubuntu:16.04`. Please don't use self-compiled base images in this project.
* For any deps you find nearing end of life, please fork and notify me so we can keep a version ready at hand
* If you'd like to communicate (e.g raise and bug, ask a question, etc.), please use the Issues feature and I'll respond as soon as I can.

# Quick Start
Since the adoption of the project to opsforge, there's 2 ways of quickly deploying Shipyard (in addition to fully manual)

## Docker Compose v3 (Recommended)
This is the de-facto method in the community to deploy any clusterised container service, so it's the recommended way of deploying.

1. Clone the project to the target machine using git clone
2. Launch the cluster from the deploy folder:
```
cd ./deploy
docker-compose -p shipyard up -d
```
You can also use the `launch.sh` and `destroy.sh` files in the `deploy` folder, however they are more designed to assist with the automated testing than deployment.

3. Destroying the cluster can be done with:
```
cd ./deploy
docker-compose -p shipyard down
```
Note, that if you left the `volumes` section uncommented for the RethinkDB, then you'll have to manually remove the persisted data from your mount directory.


## Convenience script
This is the legacy way of deploying the application and it is kept operational.

```
curl -s https://raw.githubusercontent.com/opsforgeio/shipyard/master/deploy/setup.sh | bash -s
```

For full options:

```
curl -s https://raw.githubusercontent.com/opsforgeio/shipyard/master/deploy/setup.sh | bash -s -- -h
```

# Continous Integration
CircleCI 2.0 is used for both tests and deployments in this project. You can find the configuration for testing and deployment under the `.circleci` folder in the YAML file. Currently the pipeline covers:

* GO unit testing for the controller
* binary building for the controller and docker-proxy (both GO)
* Docker image building dry-run for every branch

For `master` only (on top of the previous steps):

* QC image build for controller and docker-proxy
* Automated smoketest (minimal test coverage - HTTP checks only atm) for controller and docker-proxy
* Automated DockerHub deployment for controller and docker-proxy images on all clear

# Contributor guidelines
Contributors are welcome, particularily when it comes to the actual application code (Go / AngularJS). Any other parts can be added to on-demand as well. Please keep the following in mind when helping out:

* Make your changes in branches only (master is a protected branch, but still)
* *ALWAYS* wait for code review before merging to master, even if your tests have passed
* If you are adding new components, make the required test and build adjustments to CircleCI in your merge as well
* Always try to keep code coverage at a maximum.
* For any docker images, follow good practices. Linting will be added to the test suite soon.
* Before backporting, please try to upgrade versions and components first. This is a legacy project mostly, but we're trying to keep it up-to-date.

First and foremost: Don't overextend yourself and always make sure you are having fun!

# Disclaimer
This project was resurrected because I personally love it. I wanted to upgrade subcomponents to current versions and wrap this into an up-to-date CI/CD pipeline. Hopefully contributors can / will move this along as my knowledge with Go is limited. I will keep this up to date as far as I can when it comes to version upgrades and such, but I will not be adding new features of my own for now.

# Documentation
Full docs are available at http://shipyard-project.com

# Components
There are three components to Shipyard:

## Controller
The Shipyard controller talks to a RethinkDB instance for data storage (user accounts, engine addresses, events, etc).  It also serves the API and web interface (see below).  The controller uses Citadel to communicate to each host and handle cluster events.

## API
Everything in Shipyard is built around the Shipyard API.  It enables actions such as starting, stopping and inspecting containers, adding and removing engines and more.  It is a very simple RESTful JSON based API.

## UI
The Shipyard UI is a web interface to the Shipyard cluster.  It uses the Shipyard API for all interaction.  It is an AngularJS app that is served via the Controller.

# Contributing

## Controller
To get a development environment you will need:

* Go 1.8+
* Node.js: (npm for bower to build the Angular frontend)

Run the following:

* install [Godep](https://github.com/tools/godep): `go get github.com/tools/godep`
* run `npm install -g bower` to install bower
* run `make build` to build the binary
* run `make media` to build the media
* run `./controller -h` for options

# License
Shipyard is licensed under the Apache License, Version 2.0. See LICENSE for full license text.
