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

log 'Disable configuration for eth0'
rm -f ${ROOTFS}/etc/sysconfig/network-scripts/ifcfg-eth0

log 'Remove stale dns configuration'
echo > ${ROOTFS}/etc/resolv.conf
