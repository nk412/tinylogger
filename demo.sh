#!/usr/bin/env bash
# Script to demonstrate tinylogger

source tinylogger.bash

tlog debug "first line of script"
tlog info "Starting script $0"
tlog debug "another debug statement"

tlog info "Current time is $( date )"
tlog warn "This is a scary warning"
tlog debug "do you like these debug statements?"
tlog error "Something terrible has happened"

tlog debug "end of script"
tlog info "Script completed, go home"
