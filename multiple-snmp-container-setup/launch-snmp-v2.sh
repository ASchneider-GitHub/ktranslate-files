#!/usr/bin/env bash

# Container runs on port 162
# License key and account ID must be filled out

echo "Launching v2 SNMP container"

docker run -d --name ktranslate-snmp-v2 --restart unless-stopped --pull=always -p 162:1620/udp \
-v `pwd`/snmp-base-v2.yaml:/snmp-base.yaml \
-e NEW_RELIC_API_KEY=$licenseKey \
kentik/ktranslate:v2 \
  -snmp /snmp-base.yaml \
  -nr_account_id=$accountID \
  -metrics=jchf \
  -tee_logs=true \
  -service_name=snmp-v2 \
  -snmp_discovery_on_start=true \
  -snmp_discovery_min=180 \
  nr1.snmp