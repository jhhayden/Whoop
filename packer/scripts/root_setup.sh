#!/bin/bash
set -e
# Updating and Upgrading dependencies
sudo apt-get update -y -qq > /dev/null
sudo apt-get upgrade -y -qq > /dev/null
# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common
# Install necessary dependencies
sudo apt-get -y -q install curl wget git tmux xvfb vim
# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
# Install required libraries for RVM and Ruby
sudo apt-get -y -q install gawk libreadline6-dev zlib1g-dev libssl-dev libyaml-dev autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev libxml2-dev libxslt-dev libxml2
# install the vbox guest additions
sudo mkdir /mnt/VBoxGuestAdditions
sudo mount /home/vagrant/VBoxGuestAdditions_*.iso /mnt/VBoxGuestAdditions
sudo REMOVE_INSTALLATION_DIR=0 /mnt/VBoxGuestAdditions/VBoxLinuxAdditions.run --nox11
sudo umount /mnt/VBoxGuestAdditions 