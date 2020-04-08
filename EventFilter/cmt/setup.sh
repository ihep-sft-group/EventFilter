# echo "setup EventFilter  in /afs/ihep.ac.cn/users/l/liuyan/junofs/OEC"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtEventFiltertempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtEventFiltertempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=EventFilter -version= -path=/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC  -no_cleanup $* >${cmtEventFiltertempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=EventFilter -version= -path=/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC  -no_cleanup $* >${cmtEventFiltertempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtEventFiltertempfile}
  unset cmtEventFiltertempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtEventFiltertempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtEventFiltertempfile}
unset cmtEventFiltertempfile
return $cmtsetupstatus

