#include "SniperKernel/SvcFactory.h"
#include "HltStoreSvc.h"
#include "SniperKernel/AlgBase.h"
#include <strstream>
#include <algorithm>

DECLARE_SERVICE(HltStoreSvc);

HltStoreSvc::HltStoreSvc( const std::string& name) 
  : SvcBase(name) 
{ }

HltStoreSvc::~HltStoreSvc() { }
/*
StatusCode HltStoreSvc::queryInterface (const InterfaceID& riid, void** ppvIF ) 
{
  if ( IID_IHltStoreSvc.versionMatch(riid) ) { 
//    *ppvIF = static_cast<IHltStoreSvc*> (this); 
    *ppvIF = (HltStoreSvc*)this; 
  } else { 
    return Service::queryInterface(riid, ppvIF) ; 
  }
  return StatusCode::SUCCESS;
}
*/
bool
HltStoreSvc::initialize ( ) 
{

  LogInfo << "Start of run initialisation" << std::endl;

  
  return true;
}
bool
HltStoreSvc::execute ( )
{
  LogInfo << "Start of run executen" << std::endl;
}

bool
HltStoreSvc::finalize ( ) 
{
  ContainerType::iterator pos;
  for (pos = m_map.begin(); pos != m_map.end(); ++pos) {
//    delete (*pos).second;
  }
  m_map.erase(m_map.begin(),m_map.end());
  return true;
}

  //
  // method to print out all keys in the store
  //
void HltStoreSvc::printKeys(){
  ContainerType::iterator pos;
  for (pos = m_map.begin(); pos != m_map.end(); ++pos) {
    cout << pos->first << endl;
  }
}

int HltStoreSvc::size(){
  return m_map.size();
}

int HltStoreSvc::max_size(){
  return m_map.max_size();
}

//
// returns string that contains the length of the Store+1, or, if
//that key is already taken in the Store, length+n with n>1 and n the 
//lowest value for which the key is not already taken
//
string HltStoreSvc::sListLength(){
  unsigned int iListLength = this->size();
  iListLength += 1;
  ostrstream ListLength;
  
  //convert integer into std::string
  ListLength <<  iListLength;
  ListLength << '\0'; 
  string stringListLength = ListLength.str();          
  if (this->exists(stringListLength)){
    stringListLength = "unset";
    for (int i = 0; i < this->max_size(); i++){
      iListLength += 1;
      ListLength <<  iListLength; 
      ListLength << '\0'; 
      stringListLength = ListLength.str();
      if (!(this->exists(stringListLength))) {
        ListLength.freeze(0);
        return stringListLength;
      }
    }
  }

  ListLength.freeze(0);
  return stringListLength;
}

// return true if named object exists

bool HltStoreSvc::exists(const std::string& name) {
  return (m_map.find(name) != m_map.end());
}

