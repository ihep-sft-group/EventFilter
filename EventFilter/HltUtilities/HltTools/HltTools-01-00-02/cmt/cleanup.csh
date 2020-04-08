# echo "cleanup HltTools HltTools-01-00-02 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/HltUtilities"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltToolstempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltToolstempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=HltTools -version=HltTools-01-00-02 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/HltUtilities  $* >${cmtHltToolstempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=HltTools -version=HltTools-01-00-02 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/HltUtilities  $* >${cmtHltToolstempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtHltToolstempfile}
  unset cmtHltToolstempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtHltToolstempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtHltToolstempfile}
unset cmtHltToolstempfile
exit $cmtcleanupstatus

