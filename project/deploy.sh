#!/bin/bash

source ../../.env

### get original as-is toplogy json date
curl http://${NETVIZ}:3000/model/${NETWORK_NAME}/original_asis/topology.json > playbooks/pushed_configs_mddo_network.json

### generate clab topology file
echo "run generate clab topology file"
sudo ansible-runner run /data \
  -p /data/playbooks/generate_topo.yml \
  --cmdline "-e nodered_url=\"http://${NODERED_URL}:1880\" -e labname=\"${LABNAME}\"" \
  --container-option="--net=${NODERED_BRIDGE}" \
  --container-volume-mount="$PWD:/data" \
  --container-image="${ANSIBLERUNNER_IMAGE}:latest" \
  --process-isolation \
  --process-isolation-executable docker

### generate clab config file
echo "run generate clab config file"
sudo ansible-runner run /data \
  -p /data/playbooks/generate_config.yml \
  --cmdline "-e nodered_url=\"http://${NODERED_URL}:1880\"" \
  --container-option="--net=${NODERED_BRIDGE}" \
  --container-volume-mount="$PWD:/data" \
  --container-image="${ANSIBLERUNNER_IMAGE}:latest" \
  --process-isolation \
  --process-isolation-executable docker

### deploy containerlab
sudo ansible-runner run . \
  -p /data/playbooks/mddo-containerlab.yml \
  --cmdline "-e login_user=\"${LOCALSERVER_USER}\" -e login_pass=\"${LOCALSERVER_PASSWD}\" -e sudo_pass=\"${LOCALSERVER_SUDO}\" -e operation=create" \
  --container-volume-mount="${PWD}:/data" \
  --container-image="${ANSIBLERUNNER_IMAGE}:latest" \
  --process-isolation \
  --process-isolation-executable docker
