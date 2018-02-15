#!/bin/bash
set -e

source common/ui.sh
source common/utils.sh

debug 'Bringing container up'
utils.lxc.start

info "Cleaning up '${CONTAINER}'..."

log 'Removing temporary files...'
rm -rf ${ROOTFS}/tmp/*

log 'cleaning up dhcp leases'
rm -f ${ROOTFS}/var/lib/dhcp/*

log 'Removing downloaded packages...'
utils.lxc.attach apt-get clean

log 'Disable dhcp for eth0'
# XXX(kormat): don't use dhcp for eth0, as we statically assign IPs anyway.
# Otherwise `vagrant ssh-config` may use a dhcp-provided IP, which goes away
# after the first reboot.
cat <<EOF > ${ROOTFS}/etc/network/interfaces
auto lo
iface lo inet loopback
EOF
