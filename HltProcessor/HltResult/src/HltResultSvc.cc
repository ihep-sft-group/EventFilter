#include <iostream>
#include "HltResultSvc.h"
DECLARE_SERVICE(HltResultSvc);

HltResultSvc::HltResultSvc( const std::string& name) 
  : SvcBase(name) 
{ }

HltResultSvc::~HltResultSvc(){}
bool
HltResultSvc::initialize ( ) 
{

  LogInfo << "Start to run initialisation" << std::endl; 
  reset();
  return true;
}
bool
HltResultSvc::execute ( )
{
  LogInfo << "Start to run executen" << std::endl;
  return true;
}

bool
HltResultSvc::finalize ( ) 
{
  LogInfo << "!!! finalize !!!" << std::endl;
  m_efVec.clear();
  m_midAnswerVector.clear();
  return true;
}

bool HltResultSvc::push_back(uint32_t val){
  if(m_efVec.size()>0&&m_efVec.size()<54) return false;
  if(m_efVec.size()==0) m_efVec.resize(54,0);
  m_efVec.push_back(val);
  return true;
}

void HltResultSvc::setMidAnswer(std::string &answer)
{
  m_midanswerIndex++;
  m_midAnswerVector.push_back(answer);
}

void HltResultSvc::reset()
{
  m_answer = "Unknown";
  m_mark = "Unknown";
  m_midanswerIndex = -1;
  
}

void HltResultSvc::setAnswer(std::string &answer){ m_answer=answer; }
const std::string HltResultSvc::getAnswer() const { return m_answer; }

void HltResultSvc::setMark(std::string &mark){ m_mark=mark; }
const std::string HltResultSvc::getMark() const { return m_mark; }


const std::string HltResultSvc::getMidAnswer() const { return m_midAnswerVector[m_midanswerIndex]; }
const int HltResultSvc::getMidAnswerIndex() const { return m_midanswerIndex; }
