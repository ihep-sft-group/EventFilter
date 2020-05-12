#ifndef E_ALGORITHM_H
#define E_ALGORITHM_H

#include "SniperKernel/AlgFactory.h" 
#include "SniperKernel/AlgBase.h"
#include "SniperKernel/Task.h"
class ExampleGetResult : public AlgBase {
  public:
    ExampleGetResult(const std::string& name);
    ~ExampleGetResult() {};
    bool initialize(){return true;};
    bool execute(){return true;};
    bool finalize();
    void print();
  protected:
    std::string m_mark;
    std::string m_behaviour;
};
#endif
