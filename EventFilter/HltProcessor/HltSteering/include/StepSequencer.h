#ifndef STEPSEQUENCER_H
#define STEPSEQUENCER_H

#include <string> 
#include <math.h>
#include <vector>
#include <map>
#include "SniperKernel/Task.h"
#include "SniperKernel/AlgBase.h"
#include "SniperKernel/DLElement.h"
#include "SniperKernel/IIncidentHandler.h"

#include "Sequence.h"

class StepSequencer : public AlgBase
{
 public:

  StepSequencer(const std::string& name);
  ~StepSequencer();

  virtual bool isEnabled( ) const{return m_isEnabled;};
  void reset();
  bool initialize() { 
    LogInfo<<"!!!!!!!!!"<<std::endl;
    return true; }
  bool execute() { return true; }
  bool finalize() { return true; }  

  bool initSequencer(Sequence* );
  bool execSequencer(const std::string& seqID);

  //std::vector<AlgBase*> searchAlgForEachTE_o(Sequence* );
  bool doesExistAlready(std::string );
  AlgBase* existingAlg (std::string );
  //DummyAlg* m_DummyAlg;

 private:
  AlgBase* matchAlg;  
  std::list<AlgBase* > vMatchAlg;
  std::vector<AlgBase*> helpAlgVec;
  //std::string instance;
  std::map<std::string, std::vector<AlgBase* > > m_AlgMap;

  bool m_isEnabled;
};

#endif
