#!/usr/bin/env bash
live-server --version &>/dev/null || npm install -g live-server
live-server --host=localhost --port=8000
