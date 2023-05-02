#!/bin/bash
set -xe

xvfb-run ./release.sh "$1"
