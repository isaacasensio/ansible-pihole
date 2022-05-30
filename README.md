# ansible-pihole
Bootstrap a Raspberry Pi with Ansible and install Docker + Pi-hole

For more info about the Docker Pi-hole image please check the official repository: https://github.com/pi-hole/docker-pi-hole

## System Requirements

These roles have only been tested with:

- Raspberry Pi 4 with Ubuntu 20.04.
- Mac OS X 11.6 (BigSur)

## Getting Started

1. Create a new RPI 4 image by following the [README](packer/README.md) file.
2. Rename `example.config.yml` to `config.yml` and replace the config values as needed.
3. Rename `example.inventory.ini` to `inventory.ini` and replace the values as needed.
4. Download all dependencies `make galaxy-install`
5. Run the playbook `make run`