#!/usr/bin/env python
# -*- coding:utf-8 -*-
# author: liuyan

# using the new Mgr.

import Sniper

if __name__ == "__main__":

    task = Sniper.Task("task")
    task.setEvtMax(1)
    task.asTop()
    task.setLogLevel(2)
    
    import HltConfig
    hltConf = task.createSvc("HltConfigSvc")
    hltConf.property("seqListFile").set("/junofs/users/liuyan/OEC/EventFilter/HltProcessor/HltConfig/share/defaultseqlist.xml")
    hltConf.property("sigListFile").set("/junofs/users/liuyan/OEC/EventFilter/HltProcessor/HltConfig/share/defaultsiglist.xml")    
    
    
    import HltStore
    task.property("svcs").append("HltStoreSvc")    
    
    import HltSteering
    import HltAlgorithms
    #task.property("algs").append("EFDetectorHits")
    #task.property("algs").append("EFSectorHits")

    task.property("algs").append("StepSequencer")    
    task.property("algs").append("StepDecision")

    task.property("algs").append("StepHandler")
    import ForMpi
    forMpi = task.createAlg("ForMpi")

    
    #print(dir(Sniper))
    #print(dir(ForMpi.ForMpi))
    #k=ForMpi.ForMpi.getMpiTag()
    #task.property("algs").append("ForMpi")
    #print(dir(forMpi))
    #forMpi=Sniper.ForMpi()
    #task.addAlg(forMpi)
    #task.property("algs").append("ForMpiExp")
    #stepHand = HltSteering.createAlg(task)
    #stepHand = task.createAlg("StepHandler")
    task.show()
    task.run()
    print("#########")
    evt_tag=forMpi.getMpiTag()
    print(evt_tag)
    import ast
    tag_dict = ast.literal_eval(evt_tag)
    print(tag_dict)
