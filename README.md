<img src=etc/docker.png width=705 height=369 />

# dockerfiles
A collection of useful Dockerfile definitions for various computational endeavors.

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

### Personalization
To customize this for your own Docker usage, set the variables in the `env` file appropriately.

### Extension
To further extend the funtionality of one of the Docker images, you have two main options: changing the base image and building from the base image.

#### Change the Base Image
For changes that should reasonably be added to one of the base images, edit the Dockerfile directly. This way, every user of the image will benefit from the change. In this case, please _submit a PR to this repository_ so that everyone can benefit from the update. If you instead decide to fork this repository and update your fork only, only you will benefit from the change. Furthermore, you can more easily fall out of sync with the main branch as others make additions.

#### Submit a New Base Image
WIP

#### Building from the Base Image
For changes that are a significant deviation from the base image, which are likely not appropriate to be built into the image, please create a new `Dockerfile` which uses the original image as the starting point. To do this, use the `FROM` syntax in your `Dockerfile`:
```bash
ARG image_tag_name=<desired-image-tag-name>
FROM aagnone/bay-area:${image_tag_name}
```
Please also consider submitting a PR which adds your new image. See [Submit a New Base Image](#submit-a-new-base-image) for details on accomplishing this.
