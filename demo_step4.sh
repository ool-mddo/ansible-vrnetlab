### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars

cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp  bundle exec ./exe/mddo_toolbox.rb convert_namespace -f json  -o -t ns_table.json /mddo/netoviz_model/${NETWORK_NAME}/original_asis/topology.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_asis/topology.json
sudo docker-compose run netomox-exp bundle exec ./exe/mddo_toolbox.rb filter_low_layers -f json /mddo/netoviz_model/${NETWORK_NAME}/original_asis/topology.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/original_asis/original_asis_filtered.json
sudo docker-compose run netomox-exp bundle exec ./exe/mddo_toolbox.rb filter_low_layers -f json /mddo/netoviz_model/${NETWORK_NAME}/emulated_tobe/topology.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_tobe/emulated_tobe_filtered.json

sudo docker-compose run netomox-exp  bundle exec ./exe/mddo_toolbox.rb convert_namespace -f json -t /mddo/netoviz_model/${NETWORK_NAME}/emulated_asis/ns_table.json /mddo/netoviz_model/${NETWORK_NAME}/emulated_tobe/topology.json > $PLAYGROUND_DIR/netoviz_model/${NETWORK_NAME}/emulated_tobe/rev_topology.json

cd $MODEL_MERGE_DIR/model_merge
python3.10 config.py \
	$PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/emulated_asis/topology.json \
	$PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/emulated_tobe/emulated_tobe_filtered.json
python3.10 config.py \
	$PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/original_asis/topology.json \
	$PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/emulated_tobe/rev_topology.json


cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp bundle exec netomox diff -c /mddo/netoviz_model/$NETWORK_NAME/emulated_asis/topology.json /mddo/netoviz_model/$NETWORK_NAME/emulated_tobe/emulated_tobe_filtered.json


