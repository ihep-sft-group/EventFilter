# echo "setup HltSteering  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltSteeringtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltSteeringtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=HltSteering -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltSteeringtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=HltSteering -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltSteeringtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtHltSteeringtempfile}
  unset cmtHltSteeringtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtHltSteeringtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtHltSteeringtempfile}
unset cmtHltSteeringtempfile
return $cmtsetupstatus

