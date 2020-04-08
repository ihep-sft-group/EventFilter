#include "IEFAlgorithm.h"
#include "SniperKernel/AlgBase.h"
#include "SniperKernel/AlgFactory.h"
#include "SniperKernel/SniperLog.h"
#include "SniperKernel/SniperPtr.h"
#include "HltStoreSvc.h"

IEFAlgorithm::IEFAlgorithm(const std::string& name):
  AlgBase(name){
  declProp("OutputLevel",m_output = 7777777);
  declProp("BeamEnergy",m_beam = 1.89);
}

bool
IEFAlgorithm::initialize(){
  LogInfo << "in initialize()" << std::endl;
 
  m_run=0;

  SniperPtr<HltStoreSvc> m_HltStoreSvc("HltStoreSvc");
  if( m_HltStoreSvc.invalid()) {
    LogError << "Unable to locate HltStoreSvc" << std::endl;
    return false;
  }

  //bool sc = m_HltStoreSvc->get("EFResult", m_ef);
  //if (!sc) {
  //  LogError << "m_HltStoreSvc->get(EFResult) wrong" << std::endl;
  //  return sc;
  //}  

  
  LogInfo << "finish initialize()" << std::endl;
  return true;
}
