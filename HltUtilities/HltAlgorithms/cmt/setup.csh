# echo "setup HltAlgorithms  in /junofs/users/liuyan/OEC/EventFilter/HltUtilities"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltAlgorithmstempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltAlgorithmstempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=HltAlgorithms -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  -no_cleanup $* >${cmtHltAlgorithmstempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=HltAlgorithms -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltUtilities  -no_cleanup $* >${cmtHltAlgorithmstempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtHltAlgorithmstempfile}
  unset cmtHltAlgorithmstempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtHltAlgorithmstempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtHltAlgorithmstempfile}
unset cmtHltAlgorithmstempfile
exit $cmtsetupstatus

