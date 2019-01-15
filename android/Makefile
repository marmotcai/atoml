
default: steps

steps:

	DOCKERFILE_PATH=""

	if [ "$(DOCKERNAME)" = "ubuntu" ]; \
		then DOCKERFILE_PATH="./Dockerfile/Dockerfile-ubuntu-base" make build; fi

	if [ "$(DOCKERNAME)" = "java" ]; \
		then DOCKERFILE_PATH="./Dockerfile/Dockerfile-java" make build; fi

	if [ "$(DOCKERNAME)" = "android" ]; \
		then DOCKERFILE_PATH="./Dockerfile/Dockerfile-android" make build; fi

build:

	echo $(DOCKERNAME) '-' $(DOCKERTAG) '>>' $(DOCKERIMAGENAME)
	echo $(DOCKERFILE_PATH)

	docker build --target $(DOCKERTAG) -t $(DOCKERIMAGENAME) -f $(DOCKERFILE_PATH) .

push:

.PHONY: steps build push
.SILENT: