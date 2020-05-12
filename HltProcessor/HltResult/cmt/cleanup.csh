# echo "cleanup HltResult  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltResulttempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltResulttempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=HltResult -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltResulttempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=HltResult -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltResulttempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtHltResulttempfile}
  unset cmtHltResulttempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtHltResulttempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtHltResulttempfile}
unset cmtHltResulttempfile
exit $cmtcleanupstatus

