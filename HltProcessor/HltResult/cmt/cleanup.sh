# echo "cleanup HltResult  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltResulttempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltResulttempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=HltResult -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltResulttempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=HltResult -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltResulttempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtHltResulttempfile}
  unset cmtHltResulttempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtHltResulttempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtHltResulttempfile}
unset cmtHltResulttempfile
return $cmtcleanupstatus

