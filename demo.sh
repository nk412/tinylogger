#!/usr/bin/env bash
# Script to demonstrate tinylogger

source tinylogger.bash

logger debug "first line of script"
logger info "Starting script $0"
logger debug "another debug statement"

logger info "Current time is $( date )"
logger warn "This is a scary warning"
logger debug "do you like these debug statements?"
logger error "Something terrible has happened"

logger debug "end of script"
logger info "Script completed, go home"
