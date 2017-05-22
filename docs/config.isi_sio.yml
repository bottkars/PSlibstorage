libstorage:
 logging:
  level: info
 host: unix:///var/run/libstorage/localhost.sock
# host: tcp://127.0.0.1:7979
 embedded: true
 client:
  tls: insecure
 service:
  - isilon
  - scaleio
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
         endpoint: https://10.10.3.193:443/api
         insecure: true
         userName: admin
         password: Password123!
         systemName: ScaleIO@labbuildr
         protectionDomainName: PD_labbuildr
         storagePoolName: SP_labbuildr
      isilon:
        driver: isilon
        isilon:
         endpoint: https://10.10.3.41:8080
         insecure: true
         username: libstorage
         password: Password123!
#         volumePath: /ifs/volumes
         nfsHost: 10.10.3.40
         dataSubnet: 10.10.3.0/24
~                                     