# Create a custom Raspberry Pi image

1. Create your `user-data` cloud-init file with your configuration:

```yml
#cloud-config

# This is the user-data configuration file for cloud-init. By default this sets
# up an initial user called "ubuntu" with password "ubuntu", which must be
# changed at first login. However, many additional actions can be initiated on
# first boot from this file. The cloud-init documentation has more details:
#
# https://cloudinit.readthedocs.io/
#
hostname: pi-hole
manage_etc_hosts: true

locale: "en_GB.UTF-8"
timezone: "Europe/Madrid"
package_update: false
package_upgrade: false
packages:
 - ntp
 - screenfetch

users:
  - name: pi
    gecos: Pi Surname
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    shell: /bin/bash
    ssh_pwauth: no
    lock_passwd: true
    plain_text_passwd: myP4ssw0rd!!!
    ssh_authorized_keys:
      - <>

# These commands will be ran once on first boot only
runcmd:
  # Pickup the hostname changes
  - 'systemctl restart avahi-daemon'

##Reboot after cloud-init completes
power_state:
  mode: reboot      
```

2. Run the following command to create a custom raspberry pi 4 image using custom cloud-init scripts:

  `$ make`

