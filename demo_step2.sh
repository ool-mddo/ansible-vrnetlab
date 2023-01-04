### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars

####
### convert script  > ./project/playbooks/configs/topology.json ###

cp  ./project/playbooks/configs/topology.json $PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/emulated_asis/topology.json

sudo ansible-runner run . -p /data/project/playbooks/step02-1.yml --container-option="--net=${NODERED_BRIDGE}" \
	--container-volume-mount="$PWD:/data" --container-image=${ANSIBLERUNNER_IMAGE} \
       	--process-isolation --process-isolation-executable docker --cmdline  \
	"-e nodered_url=${NODERED_URL} -e labname=${LABNAME} -e login_user=${LOCALSERVER_USER} -e netoviz_url=${NETOVIZ_URL} -e network_name=${NETWORK_NAME} -e demo_dir=${DEMO_DIR} -k -K "


#sudo ansible-runner run . -p /data/project/playbooks/step02-2.yml --container-option="--net=${NODERED_BRIDGE}" \
#       	--container-volume-mount="$PWD:/data" --container-image=${ANSIBLERUNNER_IMAGE} \
#	--process-isolation --process-isolation-executable docker --cmdline \
#	"-e nodered_url=${NODERED_URL} -e labname=${LABNAME} -e login_user=${LOCALSERVER_USER} -e netoviz_url=${NETVIZ_URL} -e network_name=${NETWORK_NAME} -e ansible_runner_dir=${ANSIBLE_RUNNER_DIR} -k -K "

