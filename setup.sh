export CMTPROJECTPATH=""
export JUNOTOP=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r0-Pre1
export EventFilter=/junofs/users/liuyan/OEC/EventFilter
export JUNO_OFFLINE_OFF=0

pushd $JUNOTOP >& /dev/null
    source setup.sh
popd >& /dev/null

pushd $EventFilter/cmt/ >& /dev/null
    source setup.sh
popd >& /dev/null

export CMTPROJECTPATH=${WORKTOP}:${CMTPROJECTPATH}

