source ../demo_vars
curl ${NETOVIZ_URL}/model/${NETWORK_NAME}/original_asis/topology.json > $DEMO_DIR/original_asis/topology.json
curl -X 'POST'   'http://localhost:1880/description/batfish'   -H 'accept: application/json'   -H 'Content-Type: application/json'  --data @$DEMO_DIR/original_asis/topology.json | jq .  > $DEMO_DIR/emulated_asis/convert.json
python3.10 update_topology.py $DEMO_DIR/emulated_asis/convert.json $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_asis/topology.json


