/*************************
 *author: liuyan
 * ***********************/
#include "StepDecision.h"
// INCLUDE GAUDI HEADER FILES:
#include "SniperKernel/AlgFactory.h" 
#include "SniperKernel/AlgBase.h" 
#include "Signature.h"                                  
#include <string> 
#include <vector> 
#include <algorithm> 
DECLARE_ALGORITHM(StepDecision);
////////////////////////////////////////////////////////////////
//  CONSTRUCTOR:
StepDecision::StepDecision(const std::string& name): 
  AlgBase(name) {
  m_isEnabled = false;
}
                                  
// DESTRUCTOR:
StepDecision::~StepDecision() { }
                                  
/////////////////////////////////////////////////////////////////
// INITIALIZE METHOD:
bool
StepDecision::initDecision(Signature* signature) {

  /*
  //StatusCode sc = service( "HltStoreSvc", m_HltStoreSvc);
  if( sc.isFailure() ) {
    log << MSG::FATAL << name() << ": Unable to locate Service HltStoreSvc" << endreq;
    return sc;
  }
  */
  std::string sigID = signature->label();
  m_SigMap[sigID] = signature;
  LogInfo << " Find Signature with ID: " << sigID << std::endl;

  return true;
}

/////////////////////////////////////////////////////////////////
int StepDecision::execDecision(const std::string& sigID) {

  Signature* sig = m_SigMap[sigID];
  LogInfo << " Decision execute: " << sigID << std::endl;
  int decision = sig->isCriteriaMatched();

  m_continue =sig->midresult();
  m_behaviour = sig->result();
  //cout << "----"<< m_behaviour<< "  "<<m_continue<<endl;
  return decision;
}
