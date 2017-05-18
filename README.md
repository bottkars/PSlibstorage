# about

this is the first draft of PSlibstorage, a powershell interface to DELL|EMC [libstorage](http://libstorage.readthedocs.io) framework
libStorage is an open source, platform agnostic, storage provisioning and orchestration framework, model, and API.



![image](https://cloud.githubusercontent.com/assets/8255007/26189019/c8065ff6-3ba2-11e7-9c1b-4e131a31d106.png)



## requirements

* Powershell CORE 6.0.0.-beta 1 is required ( includes -skipssl for webrequests and PShost os detection )
* Windows, Linux or OS/X running Powershell

## getting started
as long as 0.1 is not reached, please clone the repo and manually run 
```
import-module pPSlibStaorage.psm1
```


## Roadmap
* current WIP: baseline modules for Get functions and Streamlining of output
  - ScaleIO validation
  - ISILON validation 
  - Azure Validation 
  
* v0.1 with installable module
  - appveyor
  - readthedocs
* v0.2 with user/pass and token based auth

