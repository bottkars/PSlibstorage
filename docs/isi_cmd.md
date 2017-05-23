```bash

 # create RBAC group
 isi auth users create libstorage --password Password123! --enabled true
 isi auth roles create --name libstorage_roles
 # asign privileges to role
 isi auth roles modify libstorage_roles --add-priv  ISI_PRIV_NS_IFS_ACCESS
 isi auth roles modify libstorage_roles --add-priv  ISI_PRIV_LOGIN_PAPI   
 isi auth roles modify libstorage_roles --add-priv  ISI_PRIV_NFS       
 isi auth roles modify libstorage_roles --add-priv  ISI_PRIV_IFS_RESTORE
 isi auth roles modify libstorage_roles --add-priv  ISI_PRIV_QUOTA      
 isi auth roles modify libstorage_roles --add-priv  ISI_PRIV_SNAPSHOT 
 # add user to RBAC group
 isi auth roles modify libstorage_roles --add-user libstorage
 +``` 
