# echo "cleanup EventFilter EventFilter-02-00-10 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtEventFiltertempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtEventFiltertempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=EventFilter -version=EventFilter-02-00-10 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5  $* >${cmtEventFiltertempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=EventFilter -version=EventFilter-02-00-10 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5  $* >${cmtEventFiltertempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtEventFiltertempfile}
  unset cmtEventFiltertempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtEventFiltertempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtEventFiltertempfile}
unset cmtEventFiltertempfile
return $cmtcleanupstatus

