#!/usr/bin/env bash
# Script to demonstrate logging.bash

source logging.bash

logging debug "first line of script"
logging info "Starting script $0"
logging debug "another debug statement"

logging info "Current time is $( date )"
logging warn "This is a scary warning"
logging debug "do you like these debug statements?"
logging error "Something terrible has happened"

logging debug "end of script"
logging info "Script completed, go home"
