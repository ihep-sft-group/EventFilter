# echo "setup HltConfig v0 in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltConfigtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltConfigtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=HltConfig -version=v0 -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltConfigtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=HltConfig -version=v0 -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltConfigtempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtHltConfigtempfile}
  unset cmtHltConfigtempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtHltConfigtempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtHltConfigtempfile}
unset cmtHltConfigtempfile
return $cmtsetupstatus

