source ./demo_vars
CUR_DIR=`pwd`

####
### convert script  > ./project/playbooks/configs/topology.json ###
original_asis=`curl ${NETOVIZ_URL}/model/${NETWORK_NAME}/original_asis/topology.json > $DEMO_DIR/original_asis/topology.json`
curl -X 'POST'   'http://localhost:1880/description/batfish'   -H 'accept: application/json'   -H 'Content-Type: application/json'  --data @$DEMO_DIR/original_asis/topology.json | jq .  > $DEMO_DIR/emulated_asis/convert.json
python3.10 project/create_ns_table.py $DEMO_DIR/emulated_asis/convert.json