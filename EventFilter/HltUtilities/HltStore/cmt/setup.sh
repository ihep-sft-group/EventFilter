# echo "setup HltStore  in /junofs/users/liuyan/OEC/EventFilter/HltUtilities"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltStoretempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltStoretempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=HltStore -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  -no_cleanup $* >${cmtHltStoretempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=HltStore -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  -no_cleanup $* >${cmtHltStoretempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtHltStoretempfile}
  unset cmtHltStoretempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtHltStoretempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtHltStoretempfile}
unset cmtHltStoretempfile
return $cmtsetupstatus

