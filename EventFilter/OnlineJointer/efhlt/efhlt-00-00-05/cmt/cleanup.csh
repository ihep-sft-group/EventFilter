# echo "cleanup efhlt efhlt-00-00-05 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtefhlttempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtefhlttempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=efhlt -version=efhlt-00-00-05 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  $* >${cmtefhlttempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=efhlt -version=efhlt-00-00-05 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  $* >${cmtefhlttempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtefhlttempfile}
  unset cmtefhlttempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtefhlttempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtefhlttempfile}
unset cmtefhlttempfile
exit $cmtcleanupstatus

