# echo "cleanup HltSteering  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltSteeringtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltSteeringtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=HltSteering -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltSteeringtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=HltSteering -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltSteeringtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtHltSteeringtempfile}
  unset cmtHltSteeringtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtHltSteeringtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtHltSteeringtempfile}
unset cmtHltSteeringtempfile
return $cmtcleanupstatus

