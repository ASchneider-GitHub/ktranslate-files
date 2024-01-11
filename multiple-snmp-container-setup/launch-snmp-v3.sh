#!/usr/bin/env bash

# Container runs on port 163
# License key and account ID must be filled out

echo "Launching v3 SNMP container"

docker run -d --name ktranslate-snmp-v3 --restart unless-stopped --pull=always -p 163:1620/udp \
-v `pwd`/snmp-base-v3.yaml:/snmp-base.yaml \
-e NEW_RELIC_API_KEY=$licenseKey \
kentik/ktranslate:v2 \
  -snmp /snmp-base.yaml \
  -nr_account_id=$accountID \
  -metrics=jchf \
  -tee_logs=true \
  -service_name=snmp-v3 \
  -snmp_discovery_on_start=true \
  -snmp_discovery_min=180 \
  nr1.snmp