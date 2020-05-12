#ifndef IEF_ALGORITHM_H
#define IEF_ALGORITHM_H

#include "HltStoreSvc.h"
#include "EFResult.h"
#include "SniperKernel/AlgFactory.h" 
#include "SniperKernel/AlgBase.h"
#include "SniperKernel/Task.h"
class IEFAlgorithm : public AlgBase {
  public:
    IEFAlgorithm(const std::string& name);
    virtual ~IEFAlgorithm() {};
    virtual bool initialize();
    virtual void reset() = 0;
    void setScope(Task* scope) {m_scope = scope;}
    Task* getScope() {return m_scope;}
  protected:
    int m_output;
    float m_beam;
    bool m_run;
    Task* m_scope;
    EFResult*          m_ef;
};
#endif
