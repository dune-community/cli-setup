#!/bin/bash

sd ()
{
  eval "$@"
  ret=$?
  notify=$(which notify-send)
  if [ -x "${notify}" ] ; then
    if [ $ret = 0 ] ; then
            notify-send -t 3000 "done" "$PWD"
    else
            notify-send -t 3000 --urgency=critical "FAILED" "$PWD"
    fi
  fi
  return $ret
}

function check_source() {
  if [ -r "${1}" ] ; then
    # shellcheck source=/dev/null
    source "${1}" ;
  fi
}

function getOptsFile( )
{
    if [ "x${1}" = "x" ] ; then
        if [ -e config.opts.last ] ; then
            OPTS=$(readlink config.opts.last)
        else
            OPTS=config.opts/gcc
            ln -sf "${OPTS}" config.opts.last
        fi
    else
        OPTS=${1}
        ln -sf "${OPTS}" config.opts.last
    fi
}

check_source PATH.sh
if [[ $OPTS == *"icc"* ]]
then
  check_source /opt/intel.PATH
fi

./dune-common/bin/dunecontrol --use-cmake info &> /dev/null
if [[ $? == 0 ]]
then
    USE_CMAKE="--use-cmake"
else
    USE_CMAKE=""
fi
