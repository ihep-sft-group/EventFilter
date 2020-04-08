# echo "setup ESController ESController-00-01-05 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtESControllertempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtESControllertempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=ESController -version=ESController-00-01-05 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  -no_cleanup $* >${cmtESControllertempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=ESController -version=ESController-00-01-05 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5/EventFilter/OnlineJointer  -no_cleanup $* >${cmtESControllertempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtESControllertempfile}
  unset cmtESControllertempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtESControllertempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtESControllertempfile}
unset cmtESControllertempfile
exit $cmtsetupstatus

