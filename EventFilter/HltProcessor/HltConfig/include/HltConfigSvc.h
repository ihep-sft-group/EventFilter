#ifndef HltConfigSvc_h
#define HltConfigSvc_h

#include "SniperKernel/SvcBase.h"
#include <vector>
#include <map>
#include <stdio.h>
#include "xercesc/dom/DOM.hpp"
#include <xercesc/util/PlatformUtils.hpp>
#include <xercesc/parsers/AbstractDOMParser.hpp>
#include <xercesc/dom/DOMImplementation.hpp>
#include <xercesc/dom/DOMImplementationLS.hpp>
#include <xercesc/dom/DOMImplementationRegistry.hpp>

#include <xercesc/dom/DOMException.hpp>
#include <xercesc/dom/DOMDocument.hpp>
#include <xercesc/dom/DOMNodeList.hpp>
#include <xercesc/dom/DOMError.hpp>
#include <xercesc/dom/DOMLocator.hpp>
#include <xercesc/dom/DOM.hpp>
#include "Sequence.h"
#include "Signature.h"
XERCES_CPP_NAMESPACE_USE
class HltConfigSvc: public SvcBase
{
    public:
        HltConfigSvc(const std::string& name);

        ~HltConfigSvc();

        bool initialize();
        bool execute();
        bool finalize();
        void buildSequenceList(const DOMDocument*, bool);
        void buildSignatureList(const DOMDocument*, bool);
        void makeTableVector();
        const std::vector<std::pair<Signature*, Sequence*> >& getTablesVector() const;
    private:
        int m_count;

        std::string m_string;
        std::string m_seqListFile;
        std::string m_sigListFile; 
        std::vector<Signature*> m_SignatureVec;
        std::vector<Sequence*> m_SequenceVec;

        std::vector<std::pair<Signature*, Sequence*> > m_TableVector;
        DOMDocument *m_Signature_DocNode;
        DOMDocument *m_Sequence_DocNode;
        int m_idSequence;
        int m_idSignature;
        int m_idCriteria;
        int m_idItem;
  
        bool m_first;
};

#endif

