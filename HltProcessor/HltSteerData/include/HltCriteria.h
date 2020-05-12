#ifndef HLTCRITERIA_H
#define HLTCRITERIA_H

#include <string>
#include <vector>
#include "HltStoreSvc.h"
class HltCriteria {
  
  typedef struct {
    std::string      name;
    float            value;
    std::string      type;
    int              id;
  } CriteriaItem;

public:
  HltCriteria(int);
  virtual ~HltCriteria() {};

  bool satisfyCriteria() const;
  void addItem(const std::string& name, float value, const std::string& type,int id);
  void print();
  void setBehaviour(const std::string& behaviour) {
    m_behaviour = behaviour;
  }

  const std::string& getBehaviour() const {
    return m_behaviour;
  }

  const int idCriteria() const {
    return m_idCriteria;
  }

  std::vector<CriteriaItem> getItemVec() {
    return m_items;
  }
  void setScope(Task* scope) {m_scope = scope;}
  Task* getScope() {return m_scope;}

private:
  std::string  m_behaviour;
  Task* m_scope;
  std::vector<CriteriaItem>        m_items;
  int               m_idCriteria;
  HltStoreSvc*         m_HltStoreSvc;
};
#endif //HLTCRITERIA_H
