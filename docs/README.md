# about

this is the first draft of PSlibstorage, a powershell interface to DELL|EMC [libstorage](http://libstorage.readthedocs.io) framework
libStorage is an open source, platform agnostic, storage provisioning and orchestration framework, model, and API.

![image](https://cloud.githubusercontent.com/assets/8255007/26189688/1ea51368-3ba6-11e7-93a8-476edeba6c5b.png)

![image](https://cloud.githubusercontent.com/assets/8255007/26189019/c8065ff6-3ba2-11e7-9c1b-4e131a31d106.png)



## requirements

* Powershell CORE 6.0.0.-beta 1 is required ( includes -skipssl for webrequests and PShost os detection )
* Windows, Linux or OS/X running Powershell
* libstorage host with running libstorage server ( example config)
 ```YAML
 
libstorage:
 host: unix:///var/run/libstorage/localhost.sock
 embedded: true
 client:
  tls: true
 service: scaleio
 integration:
    volume:
      operations:
        mount:
          preempt: true
        unmount:
          ignoreUsedCount: true
 server:
    endpoints:
      sock:
        address: unix:///var/run/libstorage/localhost.sock
      private:
        address: tcp://127.0.0.1:7979
      public:
        address: tcp://:7980
        tls:
         certFile: /etc/libstorage/tls/libstorage.crt
         keyFile: /etc/libstorage/tls/libstorage.key
    services:
      scaleio:
        driver: scaleio
        scaleio:
         endpoint: https://192.168.2.203:443/api
         insecure: true
         userName: admin
         password: Password123!
         systemName: ScaleIO@labbuildr
         protectionDomainName: PD_labbuildr
         storagePoolName: SP_labbuildr


 ```

## getting started
as long as 0.1 is not reached, please clone the repo and manually run 
```
import-module PSlibStaorage.psm1
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

