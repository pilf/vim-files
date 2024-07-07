#!/usr/bin/env bash
# See: https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md
port="$1"
if [ -z "$port" ]; then
    echo "Error, port required (e.g. '8080')" 1>&2
    exit 1
fi

VBoxManage controlvm "default" natpf1 "tcp-port$port,tcp,,$port,,$port";
VBoxManage controlvm "default" natpf1 "udp-port$port,udp,,$port,,$port";

