# echo "cleanup HltStore  in /junofs/users/liuyan/OEC/EventFilter/HltUtilities"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltStoretempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltStoretempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=HltStore -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  $* >${cmtHltStoretempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=HltStore -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  $* >${cmtHltStoretempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtHltStoretempfile}
  unset cmtHltStoretempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtHltStoretempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtHltStoretempfile}
unset cmtHltStoretempfile
exit $cmtcleanupstatus

