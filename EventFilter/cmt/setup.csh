# echo "setup EventFilter  in /afs/ihep.ac.cn/users/l/liuyan/junofs/OEC"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs/CMT/v1r26
endif
source ${CMTROOT}/mgr/setup.csh
set cmtEventFiltertempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set cmtEventFiltertempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=EventFilter -version= -path=/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC  -no_cleanup $* >${cmtEventFiltertempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/mgr/cmt setup -csh -pack=EventFilter -version= -path=/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC  -no_cleanup $* >${cmtEventFiltertempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtEventFiltertempfile}
  unset cmtEventFiltertempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtEventFiltertempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtEventFiltertempfile}
unset cmtEventFiltertempfile
exit $cmtsetupstatus

