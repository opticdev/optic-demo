
## Optic Demo Container

This repository provides the tooling necessary to build a demo container for Optic using json-server as a dummy API. The build is handled by Hashicorp's [Packer](https://www.packer.io/) and requires Docker already set up 

We don't yet have the proper repository/tag information, so for now Packer leaves these blank and the image generated must be referred to by ID. This can be retagged manually with [docker image tag](https://docs.docker.com/engine/reference/commandline/tag/), though once we settle on a repo this can be included in the Packer file.

## Installing pre-requisites

### Installing Packer

- The easiest way is via `brew` with `brew install packer` (`brew info packer` first if you'd like).
- If you'd prefer to avoid `brew` for some reason, [Download](https://www.packer.io/downloads/) from the web site and set up locally to execute.

Note: Packer 1.5.6 or newer is required. You can check your installed version with `packer --version`. If necessary, run `brew upgrade packer` or download the latest version from Packer's website.

### Installing Docker

- It looks like there's a core package, though `brew cask install docker` has worked fine to set up Docker Desktop for me on MacOS
- Failing that, follow the [Docker installation](https://docs.docker.com/docker-for-mac/install/) article.

## Building a container

With Packer installed, `packer build demo.packer` will fire off a build. By default, Packer is pretty verbose and gives you an idea of what's going on. npm WARNs will show up in red, so don't worry if you see a flood of red text unless there's an actual error.

## Updating the container

The `demo.packer` file calls out to scripts in the `scripts` folder, uploads files in the `files` folder, and otherwise gets the container ready to go. To update the container, edit:

- `demo.packer` if you want to change how the container is manipulated (_e.g._ which scripts/files are sent, tagging the container)
- `scripts/` if you want to change anything via command line/shell script in the container (_e.g._ new npm installs)
- `files/` if you want to change the behavior of an application (_e.g._ optic.yml to change how it performs, such as parameterizing the proxy port)

Once done, `packer validate demo.packer` will check the format of the packer file. It will not validate any scripts or files, and it doesn't guarantee that commands will be successful.

Once validated, issue a new build.