/**********************************
 * author: liuyan
 * 2020-4
 *******************************/
#include "SniperKernel/AlgBase.h"
#include "SniperKernel/AlgFactory.h"
#include "SniperKernel/SniperLog.h"
#include "SniperKernel/SniperPtr.h"
#include "StepHandler.h"
#include "StepSequencer.h"
#include "StepDecision.h"
#include "Sequence.h"
#include "Signature.h"
#include "NonUserIf/DLEFactory.h"
#include "HltConfigSvc.h"
#include "HltStoreSvc.h"

DECLARE_ALGORITHM(StepHandler);
 
StepHandler::StepHandler(const std::string& name): 
  AlgBase(name)
{
  std::vector<std::string> resultVec;
  resultVec.push_back("Error");
  resultVec.push_back("Rejected");
  resultVec.push_back("Accepted");
  m_EFResult = new EFResult(resultVec);

  declProp("EventTypes",  m_tmp_evtType);
}

// DESTRUCTOR:
StepHandler::~StepHandler() {
  if (m_EFResult) delete m_EFResult;
}

/////////////////////////////////////////////////////////////////
// INITIALIZE METHOD:
bool
StepHandler::initialize() {

  SniperPtr<HltConfigSvc> hltconfigsvc("HltConfigSvc"); 
  if( hltconfigsvc.invalid()) {
    LogError << "Unable to locate HltConfigSvc" << std::endl;
    return false;
  }

  SniperPtr<HltStoreSvc> hsSvc("HltStoreSvc");
  if( hsSvc.invalid()) {
    LogError << "Unable to locate HltStoreSvc" << std::endl;
    return false;
  }
  
 SniperPtr<StepSequencer> sequencerAlg("StepSequencer"); 
  if( sequencerAlg.invalid() ) {
    LogError << "Unable to create StepDecision SubAlgorithm " << std::endl;
    return false;
  }
 

  SniperPtr<StepDecision> decisionAlg("StepDecision");
  if( decisionAlg.invalid() ) {
    LogError << "Unable to create StepDecision SubAlgorithm " << std::endl;
    return false;
  }
  const std::vector<std::pair<Signature*,Sequence*> >& m_TableVector = hltconfigsvc->getTablesVector();
  std::vector<std::pair<Signature*,Sequence*> >::const_iterator It;
  
  for (It = m_TableVector.begin(); It != m_TableVector.end(); ++It) {
    sequencerAlg->initSequencer(It->second);
    decisionAlg->initDecision(It->first);
    m_stepIdList.push_back(It->second->getSeqID());
  }
  
  if (m_EFResult)
    hsSvc->put("EFResult", m_EFResult);
  else {
    LogError << "Unvalid m_EFResult" << std::endl;
    return false;
  }

  m_evtType = new EFResult(m_tmp_evtType);
  if (m_evtType)
    hsSvc->put("EventType", m_evtType);
  else {
    LogError << "Unvalid m_evtType" << std::endl;
    return false;
  }
/*
#ifdef TIME_MEASUREMENT   //// Timer
  sc = service("BesTimerSvc", m_timersvc);
  if (sc.isFailure()) {
    log << MSG::WARNING << name() << ": Unable to locate BesTimer Service" << std::endl;
    return StatusCode::FAILURE;
  }
  m_timer[0] = m_timersvc->addItem("Step Handler Time");
  m_timer[1] = m_timersvc->addItem("1stStep exec Time");
  m_timer[2] = m_timersvc->addItem("1stStep deci Time");
  m_timer[3] = m_timersvc->addItem("2ndStep exec Time");
  m_timer[4] = m_timersvc->addItem("2ndStep deci Time");

  NTuplePtr nt(ntupleSvc(),"FILE444/nt");
  if ( nt ) {
    m_tuple = nt;
    m_tuple->addItem("total", g_StepHandlerTime);
    m_tuple->addItem("mdc", g_1stStepExecTime);
    m_tuple->addItem("mdcd", g_1stStepDeciTime);
    m_tuple->addItem("emc", g_2ndStepExecTime);
    m_tuple->addItem("emcd", g_2ndStepDeciTime);
  } else {
    m_tuple = ntupleSvc()->book("FILE444/nt",CLID_ColumnWiseTuple,"StepCnt");
    if (m_tuple) {
      m_tuple->addItem("total", g_StepHandlerTime);
      m_tuple->addItem("mdc", g_1stStepExecTime);
      m_tuple->addItem("mdcd", g_1stStepDeciTime);
      m_tuple->addItem("emc", g_2ndStepExecTime);
      m_tuple->addItem("emcd", g_2ndStepDeciTime);
    } else {
      LogError <<"Cannot book N-tuple:" << long(m_tuple) << endmsg;
      return StatusCode::FAILURE;
    }
  }
  round = 0;
#endif
*/
  LogInfo << "Initialization  completed successfully" << std::endl;
  return true;
}

/////////////////////////////////////////////////////////////////
// FINALIZE METHOD:
  
bool 
StepHandler::finalize() {
  if (m_evtType)  delete m_evtType;
  return true;
}

bool
StepHandler::beginRun(){
  LogDebug << "finish initializing sub-algorithms" << std::endl;
  return true;
}

/////////////////////////////////////////////////////////////////
// EXECUTE METHOD:
bool
StepHandler::execute() {
  // MSGStream object to output messages from your algorithm
  LogDebug << "*** Executing StepHandler *** " << std::endl;

  //if(EFBesTimer::pBesTimer&&EFBesTimer::pType==2)EFBesTimer::pBesTimer->start();
/*
#ifdef TIME_MEASUREMENT   //// Timer
  m_timer[0]->start();
  m_timer[1]->start();
  m_timer[2]->start();
  m_timer[3]->start();
  m_timer[4]->start();
#endif
*/
  bool StepSeq = true;
  int  StepDec = -999;
  
  m_EFResult->reset();
  m_evtType->reset();
 


  std::string answer, result;
  std::string::size_type separator;

  SniperPtr<StepSequencer> sequencerAlg("StepSequencer");
  SniperPtr<StepDecision> decisionAlg("StepDecision");

  std::vector<std::string>::const_iterator id = m_stepIdList.begin();
  
  while (id != m_stepIdList.end()) {
    LogDebug << "In step " << (*id) << std::endl;

    StepSeq = sequencerAlg->execSequencer(*id);
    if (!StepSeq) {
      LogDebug << " Step Sequencer failed" << std::endl;
      id++;
      continue;
    } 
 
    LogDebug << "+++++++++++++++++++++++++++++" << std::endl;

    StepDec = decisionAlg->execDecision(*id);
    std::string midAnswer = decisionAlg->getContinue();
    if (midAnswer!="") m_evtType->setMidAnswer(midAnswer);
    //cout <<midAnswer<< endl;
    LogDebug << "StepDec: "<<StepDec<<" ,midAnswer:"<<midAnswer << std::endl;
    if (StepDec>-1)    m_EFResult->push_back(StepDec);
    else {
      //LogDebug << " Execute next step" << std::endl;
      m_EFResult->push_back(0);
      id++;
      continue;
    }
    answer = decisionAlg->getBehaviour();
    LogDebug << " Matched Criteria, Behaviour = " << answer << std::endl;
    
    separator = answer.find('_');
    if (separator == std::string::npos) {
      LogError << " Unknown decision result: "<< answer << std::endl;
      return false;
    }
    std::string perform = answer.substr(0, separator);

    if (perform == "reject") {
      result = "Rejected";
      break;
    }
    else if (perform == "accept") {
      result = "Accepted";
      break;
    }
    else if (perform == "jump") {
      std::string nextId = answer.substr(separator+1);
      do {
	++id;
      }	while ((id != m_stepIdList.end()) && ((*id) != nextId));
      if (id == m_stepIdList.end()) {
	LogError << " Unknown jump target: "<< nextId << std::endl;
	return false;
      }
    }
    else {
      LogError << " Unknown decision result: "<< answer << std::endl;
      return false;
    }
    //std::string evtMark = tmp.substr(tmp.find('_')+1);
    //if(evtMark!="") m_evtType->setMidAnswer(evtMark);
    //cout <<answer<<endl;
  }

  LogDebug << "==============" <<m_evtType->getAnswerIndex()<< std::endl;
  
  if (result == "Accepted") {
    std::string evtMark = answer.substr(separator+1);
    LogDebug << " Event is Accepted as " << evtMark << std::endl;
    m_evtType->setAnswer(evtMark);
  }
  else if (result == "Rejected") {
    // only beam-gas rejected defaultly
    // other type event not decided in Event Filter
    // by Fu Chengdong
    std::string evtMark = "Beamgas";
    m_evtType->setAnswer(evtMark);
    LogDebug << " Event is Rejected" << std::endl;
  }
  else {
    LogDebug << " Unknown Behaviour, force to Reject" << std::endl;
    result = "Rejected";
  }
  LogDebug << "==============" <<m_evtType->getAnswerIndex()<< std::endl;
  m_EFResult->setAnswer(result);
  
/*
#ifdef TIME_MEASUREMENT   //// Timer
  m_timer[0]->stop();
  g_StepHandlerTime=m_timer[0]->elapsed();
  if(m_tuple){
    StatusCode status = m_tuple->write();
    if (!status.isSuccess()) {
      LogError << "Can't fill ntuple!" << std::endl;
    }
  }
#endif
*/
  return true;
}
