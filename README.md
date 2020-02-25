# Flow

The script will use `sipcmd` as a SIP client. It will then ask the client to do a call as requested.
Examples are some below


# Create 100 AB users
```
export ABTOKEN="xxx"
for i in {1..99}
do
  id=`printf "%02d" $i`
  echo "Creating guest$id"
  ./scripts/ab/create-user.sh "guest$id" "111111"
  # Co response cua curl
  #
done
```

# Logout all agents
```
/opt/kazoo/utils/sup/sup acdc_maintainance logout_agents_all_accounts
```

# Login 2 Agent
`Agent will auto pickup the incoming calls`

```
docker exec -ti sipcmd_sipcmd_1_55e357913196 /bin/bash -c "
  cd /external && . .lab && export CALLPROXY="10.127.15.36"

  # Logout two users
  export CALLUSER="agent01" && ./call 8000 &
  export CALLUSER="agent03" && ./call 8000 &

  ./exit
"
```
# Logout 2 Agent

```
docker exec -ti sipcmd_sipcmd_1_55e357913196 /bin/bash -c "
  cd /external && . .lab && export CALLPROXY="10.127.15.36"

  # Logout two users
  export CALLUSER="agent01" && ./call 8001 &
  export CALLUSER="agent03" && ./call 8001 &

  ./exit
"
```

# Call to queue. 1 guest

```
docker exec -ti sipcmd_sipcmd_1_55e357913196 /bin/bash -c "
  cd /external && . .lab && export CALLPROXY="10.127.15.36"

  export CALLUSER="guest01" && ./call 1111 &

  ./exit
"

```

# Call to queue. 99 guests

```
docker exec -ti sipcmd_sipcmd_1_55e357913196 /bin/bash -c "
  cd /external && . .lab && export CALLPROXY="10.127.15.36"

  # Loop
  for i in {1..99}
  do
    id=\$(printf \"%02d\" \$i)
    echo \"Go: \$id\"
    export CALLUSER=\"guest\$id\" && ./call 1111  &
  done

  ./exit
"
```

# Cancel all current calls

`Low Book`
Lab-01 FS
```
  sudo /etc/init.d/launch.sh fs
```

Lab-04, Lab-08 KZ
```
  sudo /etc/init.d/launch.sh
```
