# echo "cleanup HltSteerData  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltSteerDatatempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltSteerDatatempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=HltSteerData -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltSteerDatatempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt cleanup -csh -pack=HltSteerData -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  $* >${cmtHltSteerDatatempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtHltSteerDatatempfile}
  unset cmtHltSteerDatatempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtHltSteerDatatempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtHltSteerDatatempfile}
unset cmtHltSteerDatatempfile
exit $cmtcleanupstatus

