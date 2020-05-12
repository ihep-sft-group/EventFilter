# echo "cleanup HltConfig v0 in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltConfigtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltConfigtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=HltConfig -version=v0 -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltConfigtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=HltConfig -version=v0 -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltConfigtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtHltConfigtempfile}
  unset cmtHltConfigtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtHltConfigtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtHltConfigtempfile}
unset cmtHltConfigtempfile
return $cmtcleanupstatus

