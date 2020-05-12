// Hits number
#ifndef EFDetectorHits_H
#define EFDetectorHits_H

#include "SniperKernel/AlgFactory.h"
#include "SniperKernel/AlgBase.h"

#include "CriteriaItemValue.h"
#include "IEFAlgorithm.h"

class EFDetectorHits: public IEFAlgorithm {
 public:
  EFDetectorHits(const std::string& name);
  virtual ~EFDetectorHits();
  virtual bool initialize();
  virtual bool execute();
  virtual bool finalize();
  virtual void reset();

 private:
  CriteriaItemValue* m_nmdc;
  CriteriaItemValue* m_nmuc;
  CriteriaItemValue* m_ntof;
  CriteriaItemValue* m_nemc;
  CriteriaItemValue* m_derr;
  CriteriaItemValue* m_rndm;
};
#endif //EFDetectorHits_H
