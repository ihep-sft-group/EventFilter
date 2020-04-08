# echo "cleanup HltStore  in /junofs/users/liuyan/OEC/EventFilter/HltUtilities"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltStoretempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltStoretempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=HltStore -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  $* >${cmtHltStoretempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=HltStore -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  $* >${cmtHltStoretempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtHltStoretempfile}
  unset cmtHltStoretempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtHltStoretempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtHltStoretempfile}
unset cmtHltStoretempfile
return $cmtcleanupstatus

