# echo "setup EFServices EFServices-00-01-09 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtEFServicestempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtEFServicestempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=EFServices -version=EFServices-00-01-09 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  -no_cleanup $* >${cmtEFServicestempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=EFServices -version=EFServices-00-01-09 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  -no_cleanup $* >${cmtEFServicestempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtEFServicestempfile}
  unset cmtEFServicestempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtEFServicestempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtEFServicestempfile}
unset cmtEFServicestempfile
exit $cmtsetupstatus

