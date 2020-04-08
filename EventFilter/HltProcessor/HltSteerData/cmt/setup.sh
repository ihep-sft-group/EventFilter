# echo "setup HltSteerData  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltSteerDatatempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltSteerDatatempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=HltSteerData -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltSteerDatatempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=HltSteerData -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltSteerDatatempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtHltSteerDatatempfile}
  unset cmtHltSteerDatatempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtHltSteerDatatempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtHltSteerDatatempfile}
unset cmtHltSteerDatatempfile
return $cmtsetupstatus

