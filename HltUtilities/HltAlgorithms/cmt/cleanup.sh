# echo "cleanup HltAlgorithms  in /junofs/users/liuyan/OEC/EventFilter/HltUtilities"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltAlgorithmstempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltAlgorithmstempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=HltAlgorithms -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  $* >${cmtHltAlgorithmstempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=HltAlgorithms -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  $* >${cmtHltAlgorithmstempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtHltAlgorithmstempfile}
  unset cmtHltAlgorithmstempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtHltAlgorithmstempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtHltAlgorithmstempfile}
unset cmtHltAlgorithmstempfile
return $cmtcleanupstatus

