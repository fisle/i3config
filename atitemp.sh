#!/bin/bash
aticonfig --odgt|grep Temperature|awk '{print $5}'|sed 's/\.00//g'
