# echo "cleanup HltConfig v0 in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltConfigtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltConfigtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=HltConfig -version=v0 -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltConfigtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=HltConfig -version=v0 -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltConfigtempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtHltConfigtempfile}
  unset cmtHltConfigtempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtHltConfigtempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtHltConfigtempfile}
unset cmtHltConfigtempfile
exit $cmtcleanupstatus

