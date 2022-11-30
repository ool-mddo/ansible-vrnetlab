#source ./.env
source ../../.env

### get original as-is toplogy json date
curl http://${NETVIZ}:3000/model/${NETWORK_NAME}/original_asis/topology.json > playbooks/pushed_configs_mddo_network.json

### run generate clab topology file
echo "run generate clab topology file"
RUN_GENERATE_CLAB_TOPO="sudo ansible-runner run /data -p /data/playbooks/generate_topo.yml --container-option='--net=${NODERED_BRIDGE}' --container-volume-mount=\"$PWD:/data\" --container-image=${ANSIBLERUNNER_IMAGE}:latest --process-isolation --process-isolation-executable docker --cmdline '-e nodered_url=http://${NODERED_URL}:1880 -e labname=${LABNAME} '"
eval $RUN_GENERATE_CLAB_TOPO

### run generate clab config file
echo "run generate clab config file"
RUN_GENERATE_CONFIG="sudo ansible-runner run /data -p /data/playbooks/generate_config.yml --container-option='--net=${NODERED_BRIDGE}' --container-volume-mount=\"$PWD:/data\" --container-image=${ANSIBLERUNNER_IMAGE}:latest --process-isolation --process-isolation-executable docker --cmdline '-e nodered_url=http://${NODERED_URL}:1880 '"
eval $RUN_GENERATE_CONFIG

### run deploy containerlab 
RUN_DEPLOY_CLAB="sudo ansible-runner run . -p /data/playbooks/mddo-containerlab.yml --container-volume-mount=\"${PWD}:/data\" --container-image=${ANSIBLERUNNER_IMAGE}:latest --process-isolation --process-isolation-executable docker --cmdline '-e login_user=${LOCALSERVER_USER} -e login_pass=${LOCALSERVER_PASSWD} -e sudo_pass=${LOCALSERVER_SUDO} -e operation=create '"
eval $RUN_DEPLOY_CLAB

