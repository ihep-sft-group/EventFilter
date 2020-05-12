#ifndef SimpleRec_H
#define SimpleRec_H

#include "CriteriaItemValue.h"
#include "IEFAlgorithm.h"

class SimpleRec: public IEFAlgorithm{
 public:
  SimpleRec(const std::string& name);
  virtual ~SimpleRec();
  virtual bool initialize();
  bool execute();
  bool finalize();
  void reset();
 private:
  CriteriaItemValue* m_energy;

};
#endif //SimpleRec_H
