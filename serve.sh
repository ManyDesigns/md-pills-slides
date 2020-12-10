#!/usr/bin/env bash
alive-server --version &>/dev/null || npm install -g live-server
live-server --host=localhost --port=8000
