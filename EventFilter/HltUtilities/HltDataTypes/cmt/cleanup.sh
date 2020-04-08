# echo "cleanup HltUtilities HltDataTypes in /junofs/users/liuyan/OEC/EventFilter"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltUtilitiestempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltUtilitiestempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=HltUtilities -version=HltDataTypes -path=/junofs/users/liuyan/OEC/EventFilter  $* >${cmtHltUtilitiestempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=HltUtilities -version=HltDataTypes -path=/junofs/users/liuyan/OEC/EventFilter  $* >${cmtHltUtilitiestempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtHltUtilitiestempfile}
  unset cmtHltUtilitiestempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtHltUtilitiestempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtHltUtilitiestempfile}
unset cmtHltUtilitiestempfile
return $cmtcleanupstatus

