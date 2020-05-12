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
}

// DESTRUCTOR:
StepHandler::~StepHandler() {
}

/////////////////////////////////////////////////////////////////
// INITIALIZE METHOD:
bool
StepHandler::initialize() {

  SniperPtr<HltConfigSvc> hltconfigsvc(getParent(),"HltConfigSvc"); 
  if( hltconfigsvc.invalid()) {
    LogError << "Unable to locate HltConfigSvc" << std::endl;
    return false;
  }

  SniperPtr<HltStoreSvc> hsSvc(getParent(),"HltStoreSvc");
  if( hsSvc.invalid()) {
    LogError << "Unable to locate HltStoreSvc" << std::endl;
    return false;
  }
  
  //SniperPtr<StepSequencer> sequencerAlg(getParent(),"StepSequencer"); 
  DLElement* objseq = DLEFactory::instance().create("StepSequencer");
  objseq->setParent(getParent());
  sequencerAlg = dynamic_cast<StepSequencer*>(objseq);
  //SniperPtr<StepDecision> decisionAlg(getParent(),"StepDecision");
  DLElement* objsig = DLEFactory::instance().create("StepDecision");
  objsig->setParent(getParent());
  decisionAlg = dynamic_cast<StepDecision*>(objsig);
  
  const std::vector<std::pair<Signature*,Sequence*> >& m_TableVector = hltconfigsvc->getTablesVector();
  std::vector<std::pair<Signature*,Sequence*> >::const_iterator It;
  
  for (It = m_TableVector.begin(); It != m_TableVector.end(); ++It) {
    sequencerAlg->initSequencer(It->second);
    decisionAlg->initDecision(It->first);
    m_stepIdList.push_back(It->second->getSeqID());
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
  LogInfo << "!!! finalize !!!" << std::endl;
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
  

  std::string answer, result, evtMark;
  std::string::size_type separator;

  SniperPtr<HltResultSvc> hltResultSvc(getParent(),"HltResultSvc");

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
    //perform=='continue'
    std::string midAnswer = decisionAlg->getContinue();
    if (midAnswer!="") {
      hltResultSvc->setMidAnswer(midAnswer);
      LogDebug << "StepDec: "<<StepDec<<" ,midAnswer:"<<midAnswer << std::endl;
    }
    LogDebug << " decision continue " << std::endl;
    if (StepDec>-1)    hltResultSvc->push_back(StepDec);
    else {
      //LogDebug << " Execute next step" << std::endl;
      hltResultSvc->push_back(0);
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
  }
  
  if (result == "Accepted") {
    evtMark = answer.substr(separator+1);
    LogDebug << " Event is Accepted as " << evtMark << std::endl;
  }
  else if (result == "Rejected") {
    // only beam-gas rejected defaultly
    // other type event not decided in Event Filter
    // by Fu Chengdong
    evtMark = "Beamgas";
    LogDebug << " Event is Rejected" << std::endl;
  }
  else {
    evtMark="Unknown";
    LogDebug << " Unknown Behaviour, force to Reject" << std::endl;
    result = "Rejected";
  }
  hltResultSvc->setAnswer(result);
  hltResultSvc->setMark(evtMark);

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
