#!/usr/bin/env bash
#--------------------------------------------------------------------------
# Timezone
#--------------------------------------------------------------------------
#
# Sets the active timezone to Europe/London
#
#

sudo sh -c "echo 'Europe/London' > /etc/timezone"
sudo dpkg-reconfigure --frontend noninteractive tzdata
