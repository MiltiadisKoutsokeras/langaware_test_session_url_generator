#!/usr/bin/env bash

################################################################################
# LANGaware (https://langaware.com/)
# Authors:
# Miltiadis Koutsokeras <miltos@langaware.com>
################################################################################

### Script setup
_SELF_="$(basename "$(readlink -e "${BASH_SOURCE[0]}")" && echo X)" && \
readonly _SELF_="${_SELF_%$'\nX'}"
_SELFDIR_="$(dirname "$(readlink -e "${BASH_SOURCE[0]}")" && echo X)" && \
readonly _SELFDIR_="${_SELFDIR_%$'\nX'}"

### Includes
# TODO: source other scripts here (source /path/to/script.sh)

### Constants
# TODO: Readonly global variables (readonly FOO='BAR')

### Global variables
# TODO: Global variables (readonly VAR='VALUE')

### Functions
# TODO: Definition of functions

################################################################################
# Main program

# TODO: main script logic

################################################################################
