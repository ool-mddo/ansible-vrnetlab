### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars
CUR_DIR=`pwd`
ansible-runner run . -p /data/project/playbooks/step03.yml --container-option="--net=${NODERED_BRIDGE}" \
	--container-volume-mount="$PWD:/data" --container-image=${ANSIBLERUNNER_IMAGE} \
	--process-isolation --process-isolation-executable docker --cmdline \
	"-e nodered_url=${NODERED_URL} -e labname=${LABNAME} -e login_user=${LOCALSERVER_USER} -e netoviz_url=${NETVIZ_URL} -e network_name=${NETWORK_NAME} -e ansible_runner_dir=${ANSIBLE_RUNNER_DIR} -k -K "


cd $PLAYGROUND_DIR
docker-compose run netomox-exp  bundle exec ./exe/mddo_toolbox.rb convert_namespace \
	-f json -o -t /mddo/netoviz_model/${NETWORK_NAME}/original_asis/ns_table.json \
	/mddo/netoviz_model/${NETWORK_NAME}/original_asis/topology.json \
	> $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_asis/topology.json

cd $CUR_DIR
curl -X 'POST'   'http://localhost:1880/description/batfish' \
	-H 'accept: application/json' -H 'Content-Type: application/json' \
       	--data @$DEMO_DIR/original_asis/topology.json | jq . > $DEMO_DIR/emulated_asis/convert.json
python3.10 project/update_topology.py $DEMO_DIR/emulated_asis/convert.json \
	$PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_asis/topology.json


echo Checking differences between emulated_asis and emulated_tobe...
cd $PLAYGROUND_DIR
docker-compose run netomox-exp bundle exec rake NETWORK=$NETWORK_NAME  PHY_SS_ONLY=1 emulated_ss_diff
docker-compose run netomox-exp bundle exec ./exe/mddo_toolbox.rb filter_low_layers \
	-f json /mddo/netoviz_model/${NETWORK_NAME}/emulated_tobe/topology.json \
	> $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_tobe/emulated_tobe_filtered.json
docker-compose run netomox-exp bundle exec netomox diff \
	-c /mddo/netoviz_model/$NETWORK_NAME/emulated_asis/topology.json \
	/mddo/netoviz_model/$NETWORK_NAME/emulated_tobe/emulated_tobe_filtered.json

