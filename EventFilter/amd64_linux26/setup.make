----------> uses
# use HltConfig v* HltProcessor (no_version_directory)
#   use HltSteerData v* HltProcessor (no_version_directory)
#     use SniperKernel v*  (no_version_directory)
#       use SniperPolicy v*  (no_version_directory)
#       use Boost v* Externals (no_version_directory)
#         use Python v* Externals (no_version_directory)
#     use HltStore v* HltUtilities (no_version_directory)
#       use SniperKernel v*  (no_version_directory)
#     use HltDataTypes v* HltUtilities (no_version_directory)
#       use SniperKernel v*  (no_version_directory)
# use HltSteerData v* HltProcessor (no_version_directory)
# use HltSteering v* HltProcessor (no_version_directory)
#   use SniperKernel v*  (no_version_directory)
#   use HltSteerData v* HltProcessor (no_version_directory)
#   use HltDataTypes v* HltUtilities (no_version_directory)
#   use HltConfig v* HltProcessor (no_version_directory)
# use HltStore v* HltUtilities (no_version_directory)
# use HltAlgorithms v* HltUtilities (no_version_directory)
#   use SniperKernel v*  (no_version_directory)
#   use HltDataTypes v* HltUtilities (no_version_directory)
#   use HltStore v* HltUtilities (no_version_directory)
#
# Selection :
use CMT v1r26 (/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalLibs)
use Python v0 Externals (/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalInterface)
use Boost v0 Externals (/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalInterface)
use SniperPolicy v0  (/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/sniper)
use SniperKernel v2  (/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/sniper)
use HltDataTypes v* HltUtilities (/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC/EventFilter)
use HltStore v* HltUtilities (/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC/EventFilter)
use HltAlgorithms v* HltUtilities (/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC/EventFilter)
use HltSteerData v* HltProcessor (/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC/EventFilter)
use HltConfig v0 HltProcessor (/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC/EventFilter)
use HltSteering v* HltProcessor (/afs/ihep.ac.cn/users/l/liuyan/junofs/OEC/EventFilter)
----------> tags
CMTv1 (from CMTVERSION)
CMTr26 (from CMTVERSION)
CMTp0 (from CMTVERSION)
Linux (from uname) package [CMT] implies [Unix]
amd64_linux26 (from CMTCONFIG)
EventFilter_no_config (from PROJECT) excludes [EventFilter_config]
EventFilter_root (from PROJECT) excludes [EventFilter_no_root]
EventFilter_cleanup (from PROJECT) excludes [EventFilter_no_cleanup]
EventFilter_scripts (from PROJECT) excludes [EventFilter_no_scripts]
EventFilter_prototypes (from PROJECT) excludes [EventFilter_no_prototypes]
EventFilter_with_installarea (from PROJECT) excludes [EventFilter_without_installarea]
EventFilter_without_version_directory (from PROJECT) excludes [EventFilter_with_version_directory]
mywork_no_config (from PROJECT) excludes [mywork_config]
mywork_root (from PROJECT) excludes [mywork_no_root]
mywork_cleanup (from PROJECT) excludes [mywork_no_cleanup]
mywork_scripts (from PROJECT) excludes [mywork_no_scripts]
mywork_prototypes (from PROJECT) excludes [mywork_no_prototypes]
mywork_with_installarea (from PROJECT) excludes [mywork_without_installarea]
mywork_without_version_directory (from PROJECT) excludes [mywork_with_version_directory]
offline_no_config (from PROJECT) excludes [offline_config]
offline_root (from PROJECT) excludes [offline_no_root]
offline_cleanup (from PROJECT) excludes [offline_no_cleanup]
offline_scripts (from PROJECT) excludes [offline_no_scripts]
offline_prototypes (from PROJECT) excludes [offline_no_prototypes]
offline_with_installarea (from PROJECT) excludes [offline_without_installarea]
offline_without_version_directory (from PROJECT) excludes [offline_with_version_directory]
sniper_no_config (from PROJECT) excludes [sniper_config]
sniper_root (from PROJECT) excludes [sniper_no_root]
sniper_cleanup (from PROJECT) excludes [sniper_no_cleanup]
sniper_scripts (from PROJECT) excludes [sniper_no_scripts]
sniper_prototypes (from PROJECT) excludes [sniper_no_prototypes]
sniper_with_installarea (from PROJECT) excludes [sniper_without_installarea]
sniper_without_version_directory (from PROJECT) excludes [sniper_with_version_directory]
ExternalInterface_no_config (from PROJECT) excludes [ExternalInterface_config]
ExternalInterface_no_root (from PROJECT) excludes [ExternalInterface_root]
ExternalInterface_cleanup (from PROJECT) excludes [ExternalInterface_no_cleanup]
ExternalInterface_scripts (from PROJECT) excludes [ExternalInterface_no_scripts]
ExternalInterface_prototypes (from PROJECT) excludes [ExternalInterface_no_prototypes]
ExternalInterface_without_installarea (from PROJECT) excludes [ExternalInterface_with_installarea]
ExternalInterface_without_version_directory (from PROJECT) excludes [ExternalInterface_with_version_directory]
x86_64 (from package CMT)
sl69 (from package CMT)
gcc447 (from package CMT)
Unix (from package CMT) excludes [WIN32 Win32]
----------> CMTPATH
# Add path /afs/ihep.ac.cn/users/l/liuyan/junofs/OEC/EventFilter from initialization
# Add path /junofs/users/liuyan/muon-sim/J16v1r4/mywork from initialization
# Add path /junofs/users/liuyan/muon-sim/J16v1r4/offline from ProjectPath
# Add path /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/sniper from ProjectPath
# Add path /cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc447/Release/J16v1r1/ExternalInterface from ProjectPath
