#include "MuonRec.h"
#include "SniperKernel/SniperLog.h"
#include "HltStoreSvc.h"
#include "SniperKernel/SniperPtr.h"

DECLARE_ALGORITHM(MuonRec);

MuonRec::MuonRec(const std::string& name) :
  IEFAlgorithm(name) {
  m_trackNo = new CriteriaItemValue;
}

MuonRec::~MuonRec() {
  delete m_trackNo;
}

bool
MuonRec::initialize(){

  IEFAlgorithm::initialize();
  //int32_t nshower=m_ef->getEFVec(38);
  //if(nshower<2)  return true;

  float trackNo=1;

  m_trackNo->setValue(trackNo);
  LogInfo <<"Number of trackNo is: "<<trackNo<<endl;
  m_run=1;
  LogInfo << "MuonRec initialize()" << std::endl;
  return true;
}

bool 
MuonRec::execute() {
  bool sc;
  SniperPtr<HltStoreSvc> hsSvc(*getParent(),"HltStoreSvc");
  if( hsSvc.invalid()) {
      LogError << "Unable to locate HltStoreSvc" << std::endl;
      return false;
  }

  sc = hsSvc->put("trackNo", m_trackNo);
  if ( !sc ) {
    LogError << "hsSvc->put(trackNo) wrong" << std::endl;
    return sc;
  }
  float              itemValue;
  CriteriaItemValue* p_itemValue;
  hsSvc->get("trackNo", p_itemValue);
  p_itemValue->getValue(itemValue);
  LogInfo << "get(trackNo): "<<itemValue << std::endl;
  LogInfo << "put(trackNo) right"<< std::endl;

  return true;
}

bool 
MuonRec::finalize() {
  LogInfo<< "MuonRec finalize()" << std::endl;
  return true;
}

void MuonRec::reset() {

  if(m_run){
    m_trackNo->reset();
    m_run=0;
  }
  return;
}

