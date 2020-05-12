#include "EFDetectorHits.h"
#include "SniperKernel/SniperLog.h"
#include "HltStoreSvc.h"
#include "EFResult.h"
#include "SniperKernel/SniperPtr.h"

DECLARE_ALGORITHM(EFDetectorHits);
EFDetectorHits::EFDetectorHits(const std::string& name) :
  IEFAlgorithm(name) {

  m_nmdc = new CriteriaItemValue;
  m_nmuc = new CriteriaItemValue;
  m_ntof = new CriteriaItemValue;
  m_nemc = new CriteriaItemValue;
  m_derr = new CriteriaItemValue;
  m_rndm = new CriteriaItemValue;
}

EFDetectorHits::~EFDetectorHits() {
  delete m_nmdc;
  delete m_nmuc;
  delete m_ntof;
  delete m_nemc;
  delete m_derr;
  delete m_rndm;
}

bool 
EFDetectorHits::initialize(){

  unsigned int nhitsMdc=1;
  unsigned int nhitsEmc=1;
  unsigned int nhitsMuc=1;
  unsigned int nhitsTof=1;

  double rndm=1.22;
  
  LogInfo << " Number of hits in MDC:EMC:MUC:TOF is " << nhitsMdc
      << ":" << nhitsEmc << ":" << nhitsMuc << ":" <<nhitsTof <<";  " 
      << "random number:" << rndm <<std::endl;

  //Part 4: Put the criteria item(s) to HltStoreSvc here
  m_nmdc->setValue(nhitsMdc);
  m_nmuc->setValue(nhitsMuc);
  m_ntof->setValue(nhitsTof);
  m_nemc->setValue(nhitsEmc);
  m_derr->setValue(1.2);
  m_rndm->setValue(rndm);
  LogInfo << "setValue" << std::endl;
 
  m_run=1;
  LogInfo << "EFDetectorHits initialized" << std::endl;
  return true;
 
}

bool
EFDetectorHits::execute() {
  LogInfo << "exe-1" << std::endl; 
  bool sc;
  SniperPtr<HltStoreSvc> hsSvc(getScope(),"HltStoreSvc");

  LogInfo << "exe-2" << std::endl;

  if( hsSvc.invalid()) {
    LogError << "Unable to locate HltStoreSvc" << std::endl;
    return false;
  }

  sc = hsSvc->put("nmdc", m_nmdc);
  if ( !sc ) {
    LogError << "hsSvc->put(nmdc) wrong" << std::endl;
    return sc;
  }
  float              itemValue;
  CriteriaItemValue* p_itemValue;
  hsSvc->get("nmdc", p_itemValue);
  p_itemValue->getValue(itemValue);
  LogInfo << "get(nmdc): "<<itemValue << std::endl;

  sc = hsSvc->put("nmuc", m_nmuc);
  if ( !sc ) {
    LogInfo << "hsSvc->put(nmuc) wrong" << std::endl;
    return sc;
  }
  sc = hsSvc->put("ntof", m_ntof);
  if ( !sc ) {
    LogInfo << "hsSvc->put(ntof) wrong" << std::endl;
    return sc;
  }
  sc = hsSvc->put("nemc", m_nemc);
  if ( !sc ) {
    LogInfo << "hsSvc->put(nemc) wrong" << std::endl;
    return sc;
  }
  sc = hsSvc->put("derr", m_derr);
  if(!sc) {
    LogInfo << "hsSvc->put(derr) wrong" << std::endl;
    return sc;
  }
  sc = hsSvc->put("rndm", m_rndm);
  if(!sc) {
    LogInfo << "hsSvc->put(rndm) wrong" << std::endl;
    return sc;
  }
  LogInfo << "hsSvc->put(nmdc) right" << std::endl;
 
  return true;
 
}

bool
EFDetectorHits::finalize() {
  LogInfo << "in finalize()" << std::endl;
  return true;
}

void EFDetectorHits::reset() {
  
  if(m_run){
    m_nmdc->reset();
    m_nmuc->reset();
    m_ntof->reset();
    m_nemc->reset();
    m_derr->reset();
    m_rndm->reset();
    m_run=0;
  }
  return;
}
