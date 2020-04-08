
#include "GaudiKernel/DeclareFactoryEntries.h"
#include "EFServices/EFEventLoopMgr.h"


DECLARE_SERVICE_FACTORY( EFEventLoopMgr )

DECLARE_FACTORY_ENTRIES( EFServices ) {
  DECLARE_SERVICE( EFEventLoopMgr );
}

