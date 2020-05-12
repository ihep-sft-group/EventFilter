#ifndef MuonRec_H
#define MuonRec_H

#include "CriteriaItemValue.h"
#include "IEFAlgorithm.h"

class MuonRec: public IEFAlgorithm{
 public:
  MuonRec(const std::string& name);
  virtual ~MuonRec();
  virtual bool initialize();
  bool execute();
  bool finalize();
  void reset();
 private:
  CriteriaItemValue* m_trackNo;

};
#endif //MuonRec_H
