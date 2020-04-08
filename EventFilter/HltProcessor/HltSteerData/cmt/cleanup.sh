# echo "cleanup HltSteerData  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltSteerDatatempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltSteerDatatempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=HltSteerData -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltSteerDatatempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=HltSteerData -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltSteerDatatempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtHltSteerDatatempfile}
  unset cmtHltSteerDatatempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtHltSteerDatatempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtHltSteerDatatempfile}
unset cmtHltSteerDatatempfile
return $cmtcleanupstatus

