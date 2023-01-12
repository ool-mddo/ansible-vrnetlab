### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars

sudo ansible-runner run . -p /data/project/playbooks/step03.yml --container-option="--net=${NODERED_BRIDGE}" \
	--container-volume-mount="$PWD:/data" --container-image=${ANSIBLERUNNER_IMAGE} \
	--process-isolation --process-isolation-executable docker --cmdline \
	"-e nodered_url=${NODERED_URL} -e labname=${LABNAME} -e login_user=${LOCALSERVER_USER} -e netoviz_url=${NETVIZ_URL} -e network_name=${NETWORK_NAME} -e ansible_runner_dir=${ANSIBLE_RUNNER_DIR} -k -K "

cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp  bundle exec ./exe/mddo_toolbox.rb convert_namespace -f json -t /mddo/netoviz_model/${NETWORK_NAME}/emulated_asis/ns_table.json /mddo/netoviz_model/${NETWORK_NAME}/original_asis/topology.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_asis/topology.json
sudo docker-compose run netomox-exp bundle exec ./exe/mddo_toolbox.rb filter_low_layers -f json /mddo/netoviz_model/${NETWORK_NAME}/original_asis/topology.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/original_asis/original_asis_filtered.json
sudo docker-compose run netomox-exp bundle exec ./exe/mddo_toolbox.rb filter_low_layers -f json /mddo/netoviz_model/${NETWORK_NAME}/emulated_tobe/topology.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_tobe/emulated_tobe_filtered.json
