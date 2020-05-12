# echo "setup HltSteerData  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltSteerDatatempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltSteerDatatempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=HltSteerData -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltSteerDatatempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=HltSteerData -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltSteerDatatempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtHltSteerDatatempfile}
  unset cmtHltSteerDatatempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtHltSteerDatatempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtHltSteerDatatempfile}
unset cmtHltSteerDatatempfile
exit $cmtsetupstatus

