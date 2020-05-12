# echo "cleanup EventFilter  in /junofs/users/liuyan/OEC"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtEventFiltertempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtEventFiltertempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=EventFilter -version= -path=/junofs/users/liuyan/OEC  $* >${cmtEventFiltertempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=EventFilter -version= -path=/junofs/users/liuyan/OEC  $* >${cmtEventFiltertempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtEventFiltertempfile}
  unset cmtEventFiltertempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtEventFiltertempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtEventFiltertempfile}
unset cmtEventFiltertempfile
exit $cmtcleanupstatus

