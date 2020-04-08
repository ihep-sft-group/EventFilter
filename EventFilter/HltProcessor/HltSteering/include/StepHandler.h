#ifndef STEPHANDLER_H
#define STEPHANDLER_H

#include <vector>
#include <string>
#include "SniperKernel/AlgBase.h" 
#include "HltConfigSvc.h"
#include "HltStoreSvc.h"
#include "EFResult.h"
#include "StepSequencer.h"
#include "StepDecision.h"
#include "SniperKernel/SniperPtr.h"
#include "HltConfigSvc.h"
#include "HltStoreSvc.h"
#ifdef TIME_MEASUREMENT  ////// Timer
//#include "GaudiKernel/NTuple.h"
#include "JunoTimer/JunoTimer.h"
#include "JunoTimer/IJunoTimerSvc.h"
#include <iomanip>  //setw()
#endif

class StepHandler : public AlgBase
{
 public:

  StepHandler(const std::string& name);
  ~StepHandler();

  bool initialize();
  bool finalize();
  bool execute();
  bool beginRun();

 private:

  //HltStoreSvc*     m_HltStoreSvc;
  //HltConfigSvc*    m_HltConfigSvc;
  //SniperPtr<StepSequencer>* sequencerAlg;
  //StepDecision*    decisionAlg;

  EFResult*        m_EFResult;
  EFResult*        m_evtType;
  std::vector<std::string> m_stepIdList;

  std::vector<std::string> m_tmp_evtType;
#ifdef TIME_MEASUREMENT   //// Timer
  //IBesTimerSvc* m_timersvc;
  //BesTimer* m_timer[5];

  //NTuple::Tuple* m_tuple;

  //NTuple::Item<float> g_StepHandlerTime;
  //NTuple::Item<float> g_1stStepExecTime;
  //NTuple::Item<float> g_1stStepDeciTime;
  //NTuple::Item<float> g_2ndStepExecTime;
  //NTuple::Item<float> g_2ndStepDeciTime;
  unsigned long round;
#endif
};

#endif
