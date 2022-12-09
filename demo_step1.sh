### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars

#sudo ansible-runner run . -p /data/project/playbooks/step01.yml --container-option="--net=${NODERED_BRIDGE}" \
#	--container-volume-mount="$PWD:/data" --container-image=${ANSIBLERUNNER_IMAGE} \
#       	--process-isolation --process-isolation-executable docker --cmdline  \
#	"-e nodered_url=${NODERED_URL} -e labname=${LABNAME} -e login_user=${LOCALSERVER_USER} -e netoviz_url=${NETOVIZ_URL} -e network_name=${NETWORK_NAME} -k -K "

# Existed Demo Clear
sudo ansible-runner run . -p /data/project/playbooks/remove.yml --container-option="--net=${NODERED_BRIDGE}" \
        --container-volume-mount="$PWD:/data" --container-image=${ANSIBLERUNNER_IMAGE} \
        --process-isolation --process-isolation-executable docker --cmdline \
        "-e nodered_url=${NODERED_URL} -e labname=${LABNAME} -e login_user=${LOCALSERVER_USER} -e netoviz_url=${NETVIZ_URL} -e network_name=${NETWORK_NAME} -e ansible_runner_dir=${ANSIBLE_RUNNER_DIR} -k -K "

# DEMO DIR Cleaning
cd $DEMO_DIR
git fetch origin demo202211
git reset --hard origin/demo202211
git checkout .

# original as-is Create topology data
sudo docker-compose run netomox-exp bundle exec rake NETWORK=mddo-ospf PHY_SS_ONLY=1
