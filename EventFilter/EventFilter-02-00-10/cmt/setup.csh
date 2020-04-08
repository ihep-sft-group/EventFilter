# echo "setup EventFilter EventFilter-02-00-10 in /afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25
endif
source ${CMTROOT}/mgr/setup.csh
set cmtEventFiltertempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtEventFiltertempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=EventFilter -version=EventFilter-02-00-10 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5  -no_cleanup $* >${cmtEventFiltertempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=EventFilter -version=EventFilter-02-00-10 -path=/afs/.ihep.ac.cn/bes3/offline/Boss/7.0.5  -no_cleanup $* >${cmtEventFiltertempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtEventFiltertempfile}
  unset cmtEventFiltertempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtEventFiltertempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtEventFiltertempfile}
unset cmtEventFiltertempfile
exit $cmtsetupstatus

