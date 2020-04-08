//Dear emacs, this is -*- c++ -*-

/**
 * @file Interface.h
 * @author <a href="dosil@ifae.es">Mireia Dosil</a> 
 * $Revision: 1.1.1.1 $
 * $Date: 2007/04/26 02:51:20 $
 *
 * @brief Interface definition between HLT and DF
 */

#ifndef EFHLT_INTERFACE_H
#define EFHLT_INTERFACE_H

#include "eformat/eformat.h"
#include <string>


/**
 * Defines the namespace that contains definitions that are common to both
 * Dataflow and the ATLAS High-Level Triggers software. This abstract
 * interface disantangles both development trees.
 */
namespace efhlt {

  /**
   * Defines common operations for the LVEF HLT software.
   */
  class Interface {

  public:

    /**
     * Virtualizes the destruction.
     */
    virtual ~Interface () {}
      
    /**
     * Configures the framework
     *
     * @param config Is the only configuration parameter passed. The
     * actual configuration implementation has to parse it, if that is the
     * case in order to find its own way through the framework's configuration
     * system.
     */
    virtual bool configure (const std::string& config) =0;

    /**
     * Unconfigures the framework, releasing all acquired resources.
     */
    virtual bool unconfigure (void) =0;

    /**
     * prepares the HLT framework for a run
     *
     * @param run_number The Run number to be used for this run.
     */
    virtual bool prepareForRun (int run_number=0) =0;

    /**
     * Process one event, taking as input a pointer to the RawEvent serialized in a contiguous
     * memory region (feStore) and giving as output the yes/no decision and the address (sdStore)
     * of the "local" memory region containing the serialized EF fragment
     */
    virtual bool process (
          const uint32_t *&feStore, 
          const uint32_t *&sdStore, 
          std::string &efDecision_s, 
          std::vector<uint32_t> &efBitPattern
    )=0;

  };

}

#endif /* EFHLT_INTERFACE_H */
