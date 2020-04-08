# echo "cleanup HltUtilities HltDataTypes in /junofs/users/liuyan/OEC/EventFilter"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltUtilitiestempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltUtilitiestempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=HltUtilities -version=HltDataTypes -path=/junofs/users/liuyan/OEC/EventFilter  $* >${cmtHltUtilitiestempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=HltUtilities -version=HltDataTypes -path=/junofs/users/liuyan/OEC/EventFilter  $* >${cmtHltUtilitiestempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtHltUtilitiestempfile}
  unset cmtHltUtilitiestempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtHltUtilitiestempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtHltUtilitiestempfile}
unset cmtHltUtilitiestempfile
exit $cmtcleanupstatus

