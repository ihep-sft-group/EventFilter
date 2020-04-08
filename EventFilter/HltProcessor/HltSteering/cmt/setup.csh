# echo "setup HltSteering  in /junofs/users/liuyan/OEC/EventFilter/HltProcessor"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtHltSteeringtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtHltSteeringtempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=HltSteering -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltSteeringtempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=HltSteering -version= -path=/junofs/users/liuyan/OEC/EventFilter/HltProcessor  -no_cleanup $* >${cmtHltSteeringtempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtHltSteeringtempfile}
  unset cmtHltSteeringtempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtHltSteeringtempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtHltSteeringtempfile}
unset cmtHltSteeringtempfile
exit $cmtsetupstatus

