#!/bin/bash
if ponymix is-muted; then
    volnoti-show -m
else
    volnoti-show $(ponymix get-volume)
fi
