## Build and upload an lxc box

We are now providing a prebuilt base box in the cloud, but below are the steps
involved to build your own local base box:
- `git clone https://github.com/anapaya/vagrant-lxc-base-boxes`
- `cd vagrant-lxc-base-boxes`
- `make xenial` for building Ubuntu 16.04
- `make bionic` for building Ubuntu 18.04
- `make 7` for building CentOS 7 with EPEL repositories

This will generate a .box file in the output folder which you can uplaod to https://app.vagrantup.com :
- Get permissions for our Vagrant cloud
- Select anapaya/lxc-xenial-amd64
- Create a New Version - Version: take version from vagrant-lxc-base-boxes/output/<DATE>/metadata.json
- Add a provider - select lxc, continue to upload
- upload the .box file from output
- Release

To test this new box update the config.vm.box_version field in the ansible repo test/Vagrantfile and follow the steps in the readme to generate lxc boxes. If it works consider creating a PR with the newer box.

### Cloudsmith.io credentials

There is a hardcoded Cloudsmith entitlement token in the script building an image. As this should not be used by the general public, the token has been disabled via https://cloudsmith.io/~anapaya/repos/internal/entitlements/?show_disabled=true. It should be enabled by the person building the new image and disabled shortly afterwards.

### Cleanup
`make clean`
