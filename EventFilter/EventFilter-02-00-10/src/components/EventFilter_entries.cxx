#include "GaudiKernel/DeclareFactoryEntries.h"
#include "EventFilter/EventFilter.h"

DECLARE_ALGORITHM_FACTORY( EventFilter )

  DECLARE_FACTORY_ENTRIES( EventFilter ) {
  DECLARE_ALGORITHM(EventFilter);
}

