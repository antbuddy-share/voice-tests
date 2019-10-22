#!/bin/bash

ABDOMAIN=${ABDOMAIN:-"xxx3.antbuddy.tech"}
ABTOKEN=${ABTOKEN:-""}
ABUSER=${1:-""}
ABPW=${2:-"111111"}
JSON="{\"name\":\"${ABUSER}\",\"username\":\"${ABUSER}\",\"password\":\"${ABPW}\",\"email\":\"${ABUSER}@${ABDOMAIN}\",\"sendEmail\":false,\"forceChangePassw\":false}"

curl "https://${ABDOMAIN}/api/organizations/create-user" -H "Pragma: no-cache" -H "Origin: https://${ABDOMAIN}" -H "Accept-Encoding: gzip, deflate, br" -H "Accept-Language: vi,en-US;q=0.9,en;q=0.8,zh;q=0.7" -H "authorization: Bearer ${ABTOKEN}" -H "Content-Type: application/json;charset=UTF-8" -H "Accept: application/json, text/plain, */*" -H "Cache-Control: no-cache" -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36" -H "Cookie: rootDomain=.antbuddy.tech; no-org=no-org; __cfduid=d3b944599018311df1024bb2cbc6137d71570895133; connect.sid=s%3A6XcwwApPsYojmkgp0qytHygf.aqDSaecti2imNHCckltqjO1YpancmjeFk0ajhoLTsnY; expires=1603367605354; token=${ABTOKEN}; monster-auth=%7B%22accountId%22%3A%22aa8b19604c5e7b0a35a60bc310e097b6%22%2C%22authToken%22%3A%2290133cb3ee57a82df06c21a606db3da8%22%7D; AB_CALL_READY=1; mp_df1f44ad2e96ec87f9dc123f15d6d4d0_mixpanel=%7B%22distinct_id%22%3A%20%2216db411480b4f2-05b781a7770d86-3f75065b-186a00-16db411480c840%22%2C%22%24device_id%22%3A%20%2216db411480b4f2-05b781a7770d86-3f75065b-186a00-16db411480c840%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D" -H "Connection: keep-alive" -H "Referer: https://${ABDOMAIN}/app" --data-binary "$JSON" --compressed
