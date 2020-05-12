#include "EFSectorHits.h"
#include "SniperKernel/SniperLog.h"
#include "HltStoreSvc.h"
#include "SniperKernel/SniperPtr.h"

DECLARE_ALGORITHM(EFSectorHits);

EFSectorHits::EFSectorHits(const std::string& name) :
  IEFAlgorithm(name) {
  m_nsec = new CriteriaItemValue;
}

EFSectorHits::~EFSectorHits() {
  delete m_nsec;
}

bool
EFSectorHits::initialize(){

  IEFAlgorithm::initialize();
  //if(nshower<2)  return true;

  float nsec=10.1;

  m_nsec->setValue(nsec);
  LogInfo <<"Number of nsec is: "<<nsec<<endl;
  m_run=1;
  LogInfo << "EFSectorHits initialize()" << std::endl;
  return true;
}

bool 
EFSectorHits::execute() {
  bool sc;
  SniperPtr<HltStoreSvc> hsSvc(*getParent(),"HltStoreSvc");
  if( hsSvc.invalid()) {
      LogError << "Unable to locate HltStoreSvc" << std::endl;
      return false;
  }

  sc = hsSvc->put("nsec", m_nsec);
  if ( !sc ) {
    LogError << "hsSvc->put(nsec) wrong" << std::endl;
    return sc;
  }
  float              itemValue;
  CriteriaItemValue* p_itemValue;
  hsSvc->get("nsec", p_itemValue);
  p_itemValue->getValue(itemValue);
  LogInfo << "get(nsec): "<<itemValue << std::endl;
  LogInfo << "put(nsec) right"<< std::endl;

  return true;
}

bool 
EFSectorHits::finalize() {
  LogInfo<< "EFSectorHits finalize()" << std::endl;
  return true;
}

void EFSectorHits::reset() {

  if(m_run){
    m_nsec->reset();
    m_run=0;
  }
  return;
}

