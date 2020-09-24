docker run -d --name=mao107 \
-e speedtest=0  -e api_port=2333 -e usemysql=1 -e downWithPanel=1 \
-e node_id=107 -e MYSQLHOST=mxxxm.maoxiong.monster -e MYSQLDBNAME="sspanel" -e MYSQLUSR="rooot" -e MYSQLPASSWD="weiqiandy" -e MYSQLPORT=3306 -e CacheDurationSec=60 \
--log-opt max-size=10m --log-opt max-file=5 \
--network=host --restart=always \
yduj9e/hef:4.25.0-beta2
