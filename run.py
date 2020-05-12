#!/usr/bin/env python
# -*- coding:utf-8 -*-
# author: liuyan

# using the new Mgr.

import Sniper

if __name__ == "__main__":

    task = Sniper.Task("task")
    task.setEvtMax(1)
    task.setLogLevel(2)
    
    import HltConfig
    #from HltConfig import HltConfigSvc
    hltConf = task.createSvc("HltConfigSvc")
    hltConf.property("seqListFile").set("/junofs/users/liuyan/OEC/EventFilter/HltProcessor/HltConfig/share/seq.xml")
    hltConf.property("sigListFile").set("/junofs/users/liuyan/OEC/EventFilter/HltProcessor/HltConfig/share/sig.xml")    
    
    import HltStore
    task.property("svcs").append("HltStoreSvc")

    import HltResult
    task.property("svcs").append("HltResultSvc")


    import HltSteering
    import HltAlgorithms

    task.property("algs").append("StepHandler")
    #For test get Result
    task.property("algs").append("ExampleGetResult")
    task.show()
    task.run()


