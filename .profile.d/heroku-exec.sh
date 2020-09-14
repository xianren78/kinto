
  if [ $(ps -ef | grep "v2ray" | grep -v "grep" | wc -l) -eq 0 ]
  then
  rm -rf /v2raybin/ss-loop*
 /entrypoint.sh
  echo "Restart v2ray Success!"
  fi