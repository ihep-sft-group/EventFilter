#include "SimpleRec.h"
#include "SniperKernel/SniperLog.h"
#include "HltStoreSvc.h"
#include "SniperKernel/SniperPtr.h"

DECLARE_ALGORITHM(SimpleRec);

SimpleRec::SimpleRec(const std::string& name) :
  IEFAlgorithm(name) {
  m_energy = new CriteriaItemValue;
}

SimpleRec::~SimpleRec() {
  delete m_energy;
}

bool
SimpleRec::initialize(){

  IEFAlgorithm::initialize();
  //if(nshower<2)  return true;

  float energy=10.1;

  m_energy->setValue(energy);
  LogInfo <<"Number of energy is: "<<energy<<endl;
  m_run=1;
  LogInfo << "SimpleRec initialize()" << std::endl;
  return true;
}

bool 
SimpleRec::execute() {
  bool sc;
  SniperPtr<HltStoreSvc> hsSvc(*getParent(),"HltStoreSvc");
  if( hsSvc.invalid()) {
      LogError << "Unable to locate HltStoreSvc" << std::endl;
      return false;
  }

  sc = hsSvc->put("energy", m_energy);
  if ( !sc ) {
    LogError << "hsSvc->put(energy) wrong" << std::endl;
    return sc;
  }
  float              itemValue;
  CriteriaItemValue* p_itemValue;
  hsSvc->get("energy", p_itemValue);
  p_itemValue->getValue(itemValue);
  LogInfo << "get(energy): "<<itemValue << std::endl;
  LogInfo << "put(energy) right"<< std::endl;

  return true;
}

bool 
SimpleRec::finalize() {
  LogInfo<< "SimpleRec finalize()" << std::endl;
  return true;
}

void SimpleRec::reset() {

  if(m_run){
    m_energy->reset();
    m_run=0;
  }
  return;
}

