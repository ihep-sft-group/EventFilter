#include "HltSteering/StepHandler.h"
#include "HltSteering/StepSequencer.h"
#include "HltSteering/StepDecision.h"
#include "GaudiKernel/DeclareFactoryEntries.h"

DECLARE_ALGORITHM_FACTORY( StepHandler )
DECLARE_ALGORITHM_FACTORY( StepSequencer )
DECLARE_ALGORITHM_FACTORY( StepDecision )


DECLARE_FACTORY_ENTRIES(HltSteering) {
    DECLARE_ALGORITHM( StepHandler );
    DECLARE_ALGORITHM( StepSequencer );
    DECLARE_ALGORITHM( StepDecision );
}
