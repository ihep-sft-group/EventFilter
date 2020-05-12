# echo "setup HltStore  in /junofs/users/liuyan/OEC/EventFilter/HltUtilities"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltStoretempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltStoretempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=HltStore -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  -no_cleanup $* >${cmtHltStoretempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=HltStore -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  -no_cleanup $* >${cmtHltStoretempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtHltStoretempfile}
  unset cmtHltStoretempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtHltStoretempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtHltStoretempfile}
unset cmtHltStoretempfile
exit $cmtsetupstatus

