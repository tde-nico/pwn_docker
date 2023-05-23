DOCKER = sudo docker

IMAGE = pwner


pwn:
	$(DOCKER) run -it --rm -v "$(shell pwd):/chal" $(IMAGE) /bin/bash

init:
	pwninit

build:
	$(DOCKER) build -t $(IMAGE) .
