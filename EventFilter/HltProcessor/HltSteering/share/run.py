#!/usr/bin/env python
# -*- coding:utf-8 -*-
# author: liuyan

# using the new Mgr.

import Sniper

if __name__ == "__main__":

    task = Sniper.Task("task")
    #task.setEvtMax(1)
    task.asTop()
    task.setLogLevel(2)
    
    import HltConfig
    hltConf = task.createSvc("HltConfigSvc")
    hltConf.property("seqListFile").set("/junofs/users/liuyan/OEC/EventFilter/HltProcessor/HltConfig/share/defaultseqlist.xml")
    hltConf.property("sigListFile").set("/junofs/users/liuyan/OEC/EventFilter/HltProcessor/HltConfig/share/defaultsiglist.xml")    
    
    import HltStore
    task.property("svcs").append("HltStoreSvc")
   
    import HltSteering
    #TestSvc = task.createSvc("TestSvc")
    task.property("algs").append("Test")
    #stepHand = HltSteering.createAlg(task)
    #stepHand = task.createAlg("StepHandler")
    task.show()

    task.run()
