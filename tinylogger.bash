# tinylogger.bash - A simple logging framework for Bash scripts in < 10 lines
# https://github.com/nk412/tinylogger

# Copyright (c) 2017 Nagarjuna Kumarappan
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# Author: Nagarjuna Kumarappan <nagarjuna.412@gmail.com>

# defaults
LOGGER_LVL=${LOGGER_LVL:="info"}
LOGGER_FMT=${LOGGER_FMT:="%Y-%m-%d %H:%M:%S"}
LOGGER_COLOR=${LOGGER_COLOR:="1"}

_tlog_levels=(error warn info debug)
_tlog_colors=('\033[0;31m' '\033[0;33m' '\033[0;32m' '\033[0;36m')

function _tlog_head {
  idx=$1
  nc='\033[0m'
  lvlname=${_tlog_levels[$idx]^^}

  if (("$LOGGER_COLOR")); then
    printf "$(date "+${LOGGER_FMT}") - ${_tlog_colors[$idx]}${lvlname}${nc}"
  else
    printf "$(date "+${LOGGER_FMT}") - ${lvlname}"
  fi
}

function tlog {
  action=$1 && shift
  case $action in
    debug)  [[ $LOGGER_LVL =~ debug ]]           && echo "$(_tlog_head 3) - $@" 1>&2 ;;
    info)   [[ $LOGGER_LVL =~ debug|info ]]      && echo "$(_tlog_head 2) - $@" 1>&2  ;;
    warn)   [[ $LOGGER_LVL =~ debug|info|warn ]] && echo "$(_tlog_head 1) - $@" 1>&2  ;;
    error)  [[ ! $LOGGER_LVL =~ none ]]          && echo "$(_tlog_head 0) - $@" 1>&2 ;;
  esac
  true;
}
