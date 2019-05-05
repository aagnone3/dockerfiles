<img src=etc/docker.png width=705 height=369 />

# dockerfiles
A collection of useful Dockerfile definitions for various purposes

## Prerequisites
- Install [Docker](https://docs.docker.com/install)
- (Optional) set up your [Docker Hub repository](https://hub.docker.com/)

## Usage

### What's Available?
To see available Make-driven commands, `cd` into the directory of your desired image and run `make help`.

### Basic Setup
```bash
cd machine-learning

# build the image
make image

# enter the container in a bash shell
make run

# enter the container in a jupyter-lab instance
make jup
```
