#!/bin/bash
IP=$(curl --silent http://myexternalip.com/raw)
echo $IP
