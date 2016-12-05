
function getOptsFile( )
{
    if [ x${1} = x ] ; then
        if [ -e config.opts.last ] ; then
            OPTS=$(readlink config.opts.last)
        else
            OPTS=config.opts/gcc
            ln -sf ${OPTS} config.opts.last
        fi
    else
        OPTS=${1}
        ln -sf ${OPTS} config.opts.last
    fi
}

source PATH.sh
if [[ $OPTS == *"icc"* ]]
then
  source /opt/intel.PATH
fi
