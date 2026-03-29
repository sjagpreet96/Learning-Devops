#!/bin/bash

source_dir="$1"

if [ -z "$1" ]; then
	read -p "Please Enter Source Directory:" source_dir
fi
