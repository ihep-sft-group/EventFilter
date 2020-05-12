#include "ExampleGetResult.h"
#include "SniperKernel/AlgBase.h"
#include "SniperKernel/AlgFactory.h"
#include "SniperKernel/SniperLog.h"
#include "SniperKernel/SniperPtr.h"
#include "HltResultSvc.h"
DECLARE_ALGORITHM(ExampleGetResult);
ExampleGetResult::ExampleGetResult(const std::string& name):
  AlgBase(name){
}
void
ExampleGetResult::print(){
  SniperPtr<HltResultSvc> hltResultSvc(getParent(),"HltResultSvc");
  m_mark = hltResultSvc->getMark();
  m_behaviour = hltResultSvc->getAnswer();
  LogInfo<<"###### EXAMPLE GET EF RESULT: Behaviour = "<<m_behaviour<<" and Mark tag = "<<m_mark<<std::endl;
}
bool
ExampleGetResult::finalize(){
  print();
  return true;
}
