# echo "cleanup HltSteering  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltSteeringtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltSteeringtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=HltSteering -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltSteeringtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=HltSteering -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltSteeringtempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtHltSteeringtempfile}
  unset cmtHltSteeringtempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtHltSteeringtempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtHltSteeringtempfile}
unset cmtHltSteeringtempfile
exit $cmtcleanupstatus

