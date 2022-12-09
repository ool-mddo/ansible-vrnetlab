### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars

# DEMO DIR Cleaning
cd $DEMO_DIR
git fetch origin demo202211
git reset --hard origin/demo202211
git clean -f

# original as-is Create topology data
cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp bundle exec rake NETWORK=mddo-ospf PHY_SS_ONLY=1
