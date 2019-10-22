# Create 100 AB users
```
export ABTOKEN="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1ZGExY2Q1NjJiYWI2ZjFlMDBiZGI1MDkiLCJleHAiOjE2MDM0NDgwOTg5MDJ9.Wn2nqYsW5V7DSB6FezBaqNfv-DhooBuAPUJF2eScTdI"
for i in {1..99}
do
  id=`printf "%02d" $i`
  echo "Creating guest$id"
  ./scripts/ab/create-user.sh "guest$id" "111111"
  # Co response cua curl
  #
done
```

# Login 2 Agent

docker exec -ti sipcmd_sipcmd_1_55e357913196 /bin/bash -c "
  cd /external && . .lab && export CALLPROXY="10.127.15.36"

  # Login two uses
  export CALLUSER="agent01" && ./call 8000
  export CALLUSER="agent03" && ./call 8000
"

# Login 2 Agent
docker exec -ti sipcmd_sipcmd_1_55e357913196 /bin/bash -c "
  cd /external && . .lab && export CALLPROXY="10.127.15.36"

  # Login two uses
  export CALLUSER="agent01" && ./call 8001
  export CALLUSER="agent03" && ./call 8001
"

# Call to queue
docker exec -ti sipcmd_sipcmd_1_55e357913196 /bin/bash -c "
  cd /external && . .lab && export CALLPROXY="10.127.15.36"

  # Login two uses
  export CALLUSER="caller01" && ./call 1111
"
