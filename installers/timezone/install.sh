#!/usr/bin/env bash

sudo sh -c "echo 'Europe/London' > /etc/timezone"
sudo dpkg-reconfigure --frontend noninteractive tzdata
