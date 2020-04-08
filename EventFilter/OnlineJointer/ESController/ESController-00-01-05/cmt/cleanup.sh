# echo "cleanup ESController ESController-00-01-05 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtESControllertempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtESControllertempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=ESController -version=ESController-00-01-05 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  $* >${cmtESControllertempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=ESController -version=ESController-00-01-05 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  $* >${cmtESControllertempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtESControllertempfile}
  unset cmtESControllertempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtESControllertempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtESControllertempfile}
unset cmtESControllertempfile
return $cmtcleanupstatus

