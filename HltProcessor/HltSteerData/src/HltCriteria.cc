#include <cmath>
#include "HltCriteria.h"
#include <boost/python.hpp>
#include "SniperKernel/SniperLog.h"
#include "SniperKernel/SniperPtr.h"
#include "SniperKernel/Task.h"
#include "CriteriaItemValue.h"
#include "HltStoreSvc.h"
HltCriteria::HltCriteria(int id)
  :m_idCriteria(id)
{}

bool HltCriteria::satisfyCriteria() const {
 
  CriteriaItemValue* p_itemValue;
  float              itemValue;
  std::vector<CriteriaItem>::const_iterator it = m_items.begin();

  bool judge=true;
  SniperPtr<HltStoreSvc> hsSvc(*m_scope,"HltStoreSvc");
  if( hsSvc.invalid()) {
    LogError << "Unable to locate HltStoreSvc" << std::endl;
    return false;
  }

  LogInfo << " items size: " << m_items.size() << std::endl;

  while (it != m_items.end()) {
    LogInfo << "item_name: " << it->name << std::endl;

    bool status = hsSvc->get(it->name, p_itemValue);
    if (!status) return false;
    status = p_itemValue->getValue(itemValue);
    if (!status) return false;

    LogInfo << " items value: " << itemValue << std::endl;

    if (it->type == "MIN") {
      if (itemValue <= it->value) judge= false;
    } else if (it->type == "MAX") {
      if (itemValue >= it->value) judge= false;
    } else if (it->type == "TRUE") {
      if (fabs(itemValue - it->value) > 0.000001) judge= false;
    } else if (it->type == "FALSE") {
      if (fabs(itemValue - it->value) < 0.000001) judge= false;
    }else if (it->type == "STREQ"){
      if(itemValue != it->value) judge= false;
    } else {
      std::cout << "In HltCriteria::satisfyCriteria() ==> Unvalid CriteriaItemType!" << std::endl;
      exit(1);
    }

    if(it->name =="nmuc"){

    }
    else if(it->name =="nmdc"){

    }
    else if(it->name=="etot"&&it->type=="MIN"){
      
    }
    else if(it->name=="etot"&&it->type=="MAX"){
      
    }
    else if(it->name=="acop"&&it->type=="MAX"){
      
    }
    it++;
  }

  //std::cout << "HltCriteria::satisfyCriteria() return true" << std::endl;
  return judge;
}

void HltCriteria::addItem(const std::string& name, float value, const std::string& type,int id) {
  CriteriaItem it = {name, value, type,id};
  m_items.push_back(it);
}
void HltCriteria::print(){ 
    for(std::vector< CriteriaItem>::iterator i =m_items.begin();i!=m_items.end(); ++i){
        LogInfo<<"CriteriaItem: "<<(*i).name<<" - "<<(*i).value<<" - "<<(*i).type<<" - "<<(*i).id<<std::endl;
    }
}
