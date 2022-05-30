.PHONY: build

build:
	docker run --rm --privileged -v /dev:/dev -v ${PWD}:/build mkaczanowski/packer-builder-arm build ubuntu_server_20.04_arm64.pkr.hcl
