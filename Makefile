SKAFFOLD_DEFAULT_REPO ?= ghcr.io/mjpitz

docker/hashistack:
	docker build hashistack/base -t $(SKAFFOLD_DEFAULT_REPO)/hashistack:base
	docker build hashistack/alpine -t $(SKAFFOLD_DEFAULT_REPO)/hashistack:latest-alpine -t $(SKAFFOLD_DEFAULT_REPO)/hashistack:latest
	docker build hashistack/dind -t $(SKAFFOLD_DEFAULT_REPO)/hashistack:latest-dind

docker/hashistack/push:
	docker buildx build hashistack/base \
		--platform linux/amd64,linux/arm64 \
		--tag $(SKAFFOLD_DEFAULT_REPO)/hashistack:base \
		--push
	docker buildx build hashistack/alpine \
		--platform linux/amd64,linux/arm64 \
		--tag $(SKAFFOLD_DEFAULT_REPO)/hashistack:latest-alpine \
		--tag $(SKAFFOLD_DEFAULT_REPO)/hashistack:latest \
		--push
	docker buildx build hashistack/dind \
		--platform linux/amd64,linux/arm64 \
		--tag $(SKAFFOLD_DEFAULT_REPO)/hashistack:latest-dind \
		--push


docker/nomad:
	docker build nomad/alpine \
		--tag $(SKAFFOLD_DEFAULT_REPO)/nomad:latest-alpine \
		--tag $(SKAFFOLD_DEFAULT_REPO)/nomad:latest
	docker build nomad/dind --tag $(SKAFFOLD_DEFAULT_REPO)/nomad:latest-dind

docker/nomad/push:
	docker buildx build nomad/alpine \
		--platform linux/amd64,linux/arm64 \
		--tag $(SKAFFOLD_DEFAULT_REPO)/nomad:latest-alpine \
		--tag $(SKAFFOLD_DEFAULT_REPO)/nomad:latest \
		--push
	docker buildx build nomad/dind \
		--platform linux/amd64,linux/arm64 \
		--tag $(SKAFFOLD_DEFAULT_REPO)/nomad:latest-dind \
		--push
