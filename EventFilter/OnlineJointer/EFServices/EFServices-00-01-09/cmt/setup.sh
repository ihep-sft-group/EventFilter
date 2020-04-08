# echo "setup EFServices EFServices-00-01-09 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtEFServicestempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtEFServicestempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=EFServices -version=EFServices-00-01-09 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  -no_cleanup $* >${cmtEFServicestempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=EFServices -version=EFServices-00-01-09 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  -no_cleanup $* >${cmtEFServicestempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtEFServicestempfile}
  unset cmtEFServicestempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtEFServicestempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtEFServicestempfile}
unset cmtEFServicestempfile
return $cmtsetupstatus

