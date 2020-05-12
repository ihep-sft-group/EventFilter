# echo "setup EventFilter  in /junofs/users/liuyan/OEC"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtEventFiltertempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtEventFiltertempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=EventFilter -version= -path=/junofs/users/liuyan/OEC  -no_cleanup $* >${cmtEventFiltertempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=EventFilter -version= -path=/junofs/users/liuyan/OEC  -no_cleanup $* >${cmtEventFiltertempfile}"
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

