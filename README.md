# vagrant-lxc base boxes

This repository contains a set of scripts for creating base boxes for usage with
[vagrant-lxc](https://github.com/fgrehm/vagrant-lxc) 1.0+.

## What distros / versions can I build with this?

* Ubuntu
  - Precise 12.04 x86_64
  - Quantal 12.10 x86_64
  - Raring 13.04 x86_64
  - Saucy 13.10 x86_64
  - Trusty 14.04 x86_64
  - Utopic 14.10 x86_64
  - Vivid 15.04 x86_64
  - Wily 15.10 x86_64
  - Xenial 16.04 x86_64
* Debian
  - Squeeze x86_64
  - Wheezy x86_64
  - Jessie x86_64
  - Stretch x86_64
  - Sid x86_64
* Fedora
  - 19 x86_64
  - 20 x86_64
  - 21 x86_64
  - 22 x86_64
  - 23 x86_64
  - rawhide x86_64
* CentOS
  - 6 x86_64
  - 7 x86_64

## Build and upload an lxc box

We are now providing a prebuilt base box in the cloud, but below are the steps
involved to build your own local base box:
- `git clone https://github.com/anapaya/vagrant-lxc-base-boxes`
- `cd vagrant-lxc-base-boxes`
- `make xenial`

This will generate a .box file in the output folder which you can uplaod to https://app.vagrantup.com :
- Get permissions for our Vagrant cloud
- Select anapaya/lxc-xenial-amd64
- Create a New Version - Version: <DATE>
- Add a provider - select lxc, continue to upload
- upload the .box file from output
- Release

To test this new box update the config.vm.box_version field in the ansible repo test/Vagrantfile and follow the steps in the readme to generate lxc boxes. If it works consider creating a PR with the newer box.

### Cleanup
`make clean`

## Pre built base boxes

_**NOTE:** None of the base boxes below have a provisioner pre-installed_

| Distribution | VagrantCloud box |
| ------------ | ---------------- |
| Ubuntu Precise 12.04 x86_64 | [fgrehm/precise64-lxc](https://vagrantcloud.com/fgrehm/precise64-lxc) |
| Ubuntu Trusty 14.04 x86_64 | [fgrehm/trusty64-lxc](https://vagrantcloud.com/fgrehm/trusty64-lxc) |
| Debian Wheezy 7 x86_64 | [fgrehm/wheezy64-lxc](https://vagrantcloud.com/fgrehm/wheezy64-lxc) |
| Debian Jessie 8 x86_64 | [glenux/jessie64-lxc](https://atlas.hashicorp.com/glenux/boxes/jessie64-lxc) |
| CentOS 6 x86_64 | [fgrehm/centos-6-64-lxc](https://vagrantcloud.com/fgrehm/centos-6-64-lxc) |


## What makes up for a vagrant-lxc base box?

See [vagrant-lxc/BOXES.md](https://github.com/fgrehm/vagrant-lxc/blob/master/BOXES.md)


## Known issues

* We can't get the NFS client to be installed on the containers used for building
  Ubuntu 13.04 / 13.10 / 14.04 base boxes.
* Puppet can't be installed on Debian Sid
* Salt can't be installed on Ubuntu 13.04
