### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars

sudo ansible-runner run . -p /data/project/playbooks/step01.yml --container-option="--net=${NODERED_BRIDGE}" --container-volume-mount="$PWD:/data" --container-image=${ANSIBLERUNNER_IMAGE}:latest --process-isolation --process-isolation-executable docker --cmdline "-e nodered_url=${NODERED_URL} -e labname=${LABNAME} -e login_user=${LOCALSERVER_USER} -e netoviz_url=${NETOVIZ_URL} -e network_name=${NETWORK_NAME} -k -K "

