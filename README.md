
## Optic Demo Container

This repository provides the tooling necessary to build a demo container for Optic using json-server as a dummy API. This is intended solely for use with a documented demo walkthrough - if you'd like to see Optic running in your environment, please follow the [Optic setup](https://docs.useoptic.com/setup) instructions. 

## Installing pre-requisites

### Installing Docker

- It looks like there's a core package, though `brew cask install docker` has worked fine to set up Docker Desktop for me on MacOS
- Failing that, follow the [Docker installation](https://docs.docker.com/docker-for-mac/install/) article.

## Container deploy process and pushing changes

The Dockerhub repository image is updated automatically when pushed to `master` on GitHub using a GitHub Action, no manual build is required to deploy. When submitting changes, please target the `develop` branch with PRs. That allows us to complete a review, and still have a staging area if we expect behavior changes.

## Building and testing a container locally 

It's good practice to confirm the container builds and runs the Optic Dashboard and Optic proxies `json-server`. These tests are not automated at this point. To build locally for testing, invoke the Dockerfile within the root of the repository with

``` sh
docker build -t useoptic/optic-demo:latest .
```

## Updating the container

The `Dockerfile` file uses scripts in the `scripts` folder to set up the image (pull and initialize `Optic` and `json-server`. It then uploads files in the `files` folder that provide operational context (`optic.yml` and additional shell scripts and assets for the demo walkthrough). To update the container, edit:

As a reminder, it's good practice to run a local build to validate everything works.
