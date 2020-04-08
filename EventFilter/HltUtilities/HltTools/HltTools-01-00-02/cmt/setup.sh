# echo "setup HltTools HltTools-01-00-02 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/HltUtilities"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtHltToolstempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtHltToolstempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=HltTools -version=HltTools-01-00-02 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/HltUtilities  -no_cleanup $* >${cmtHltToolstempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=HltTools -version=HltTools-01-00-02 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/HltUtilities  -no_cleanup $* >${cmtHltToolstempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtHltToolstempfile}
  unset cmtHltToolstempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtHltToolstempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtHltToolstempfile}
unset cmtHltToolstempfile
return $cmtsetupstatus

