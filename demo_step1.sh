### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars

# DEMO DIR Cleaning
cd $DEMO_DIR
#git fetch origin $LABNAME
#git reset --hard origin/$LABNAME
git clean -f

# original as-is Create topology data
cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp bundle exec rake NETWORK=$NETWORK_NAME PHY_SS_ONLY=1
