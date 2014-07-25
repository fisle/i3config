#!/bin/bash
#aticonfig --odgt|grep Temperature|awk '{print $5}'|sed 's/\.00//g'
sensors -u radeon-pci-0100 | grep -P -o '[0-9]{2}(?=\.)'
