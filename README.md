# EventFilter

## 1.setup env  
    *change the Path to your Path: export EventFilter=/YourPath/EventFilter  
    *source setup.sh  
    *For first clone, your need cmt only 1 time  
            cd EventFilter/cmt  
            cmt br cmt config  
            cmt make  
            source setup.sh  

  
## 2.run python  
  
python run.py  
  
## 3.example Get EFResult
    if you want to get the result,please see the  
          EventFilter/HltProcessor/HltResult/src/ExampleGetResult.cc  
    just write like the C file.  

## 4.example define user algrithm  
  
    if you want to config the user algrithm, please see the  
          EventFilter/HltUtilities/HltAlgorithms/src/SimpleRec.cc  
    just write like the C file.  
    Then cmt the file, use below command:  
         cmt br cmt config  
         cmt make  
       
    Attention, You need to config the sequence.xml and put you algrithm in it like before.
   
