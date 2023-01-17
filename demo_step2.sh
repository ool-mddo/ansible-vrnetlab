### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars
CUR_DIR=`pwd`

####
### convert script  > ./project/playbooks/configs/topology.json ###
#original_asis=`curl ${NETOVIZ_URL}/model/${NETWORK_NAME}/original_asis/topology.json > $DEMO_DIR/original_asis/topology.json`
#curl -X 'POST'   'http://localhost:1880/description/batfish'   -H 'accept: application/json'   -H 'Content-Type: application/json'  --data @$DEMO_DIR/original_asis/topology.json | jq .  > $DEMO_DIR/emulated_asis/convert.json
#python3.10 project/create_ns_table.py $DEMO_DIR/emulated_asis/convert.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_asis/ns_table.json

cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp  bundle exec ./exe/mddo_toolbox.rb convert_namespace -f json -t ns_table.json -o  /mddo/netoviz_model/${NETWORK_NAME}/original_asis/topology.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_asis/topology.json
#sudo docker-compose run netomox-exp  bundle exec ./exe/mddo_toolbox.rb convert_namespace -f json -t /mddo/netoviz_model/${NETWORK_NAME}/emulated_asis/ns_table.json /mddo/netoviz_model/${NETWORK_NAME}/original_asis/topology.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_asis/topology.json

curl ${NETOVIZ_URL}/model/${NETWORK_NAME}/original_asis/topology.json > $DEMO_DIR/original_asis/topology.json
curl -X 'POST'   'http://localhost:1880/description/batfish'   -H 'accept: application/json'   -H 'Content-Type: application/json'  --data @$DEMO_DIR/original_asis/topology.json | jq .  > $DEMO_DIR/emulated_asis/convert.json

cd $CUR_DIR
python3.10 project/update_topology.py $DEMO_DIR/emulated_asis/convert.json $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_asis/topology.json
sudo ansible-runner run . -p /data/project/playbooks/step02-1.yml --container-option="--net=${NODERED_BRIDGE}" \
	--container-volume-mount="$PWD:/data" --container-image=${ANSIBLERUNNER_IMAGE} \
       	--process-isolation --process-isolation-executable docker --cmdline  \
	"-e nodered_url=${NODERED_URL} -e labname=${LABNAME} -e login_user=${LOCALSERVER_USER} -e netoviz_url=${NETOVIZ_URL} -e network_name=${NETWORK_NAME} -e demo_dir=${DEMO_DIR} -k -K "


#sudo ansible-runner run . -p /data/project/playbooks/step02-2.yml --container-option="--net=${NODERED_BRIDGE}" \
#       	--container-volume-mount="$PWD:/data" --container-image=${ANSIBLERUNNER_IMAGE} \
#	--process-isolation --process-isolation-executable docker --cmdline \
#	"-e nodered_url=${NODERED_URL} -e labname=${LABNAME} -e login_user=${LOCALSERVER_USER} -e netoviz_url=${NETVIZ_URL} -e network_name=${NETWORK_NAME} -e ansible_runner_dir=${ANSIBLE_RUNNER_DIR} -k -K "

