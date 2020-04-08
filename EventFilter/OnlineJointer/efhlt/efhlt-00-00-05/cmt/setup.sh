# echo "setup efhlt efhlt-00-00-05 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtefhlttempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtefhlttempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=efhlt -version=efhlt-00-00-05 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  -no_cleanup $* >${cmtefhlttempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=efhlt -version=efhlt-00-00-05 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  -no_cleanup $* >${cmtefhlttempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtefhlttempfile}
  unset cmtefhlttempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtefhlttempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtefhlttempfile}
unset cmtefhlttempfile
return $cmtsetupstatus

