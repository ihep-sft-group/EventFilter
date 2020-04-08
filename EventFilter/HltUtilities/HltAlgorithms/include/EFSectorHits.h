#ifndef EFSectorHits_H
#define EFSectorHits_H

#include "CriteriaItemValue.h"
#include "IEFAlgorithm.h"

class EFSectorHits: public IEFAlgorithm{
 public:
  EFSectorHits(const std::string& name);
  virtual ~EFSectorHits();
  virtual bool initialize();
  bool execute();
  bool finalize();
  void reset();
 private:
  CriteriaItemValue* m_nsec;

};
#endif //EFSectorHits_H
