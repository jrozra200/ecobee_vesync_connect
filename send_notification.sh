#!/bin/bash

echo "Auth is not working right now" | mailx -v \
-r "WHOEVER@gmail.com" \
-s "Login Issues" \
-S smtp="smtp.gmail.com:587" \
-S smtp-use-starttls \
-S smtp-auth=login \
-S smtp-auth-user="USERNAME@gmail.com" \
-S smtp-auth-password="PASSWORD" \
-S ssl-verify=ignore \
-S nss-config-dir=/etc/pki/nssdb/ \
WHOVEVER@gmail.com