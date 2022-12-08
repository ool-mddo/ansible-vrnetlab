### containerlab server login & sudo password Setting
###Example
###$ cat env/passwords 
###---
###"^SSH password:\\s*?$": "login password"
###"^BECOME password.*:\\s*?$": "login password"

source ./demo_vars

cd $MODEL_MERGE_DIR/model_merge
python3.10 merge.py config \
	$PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/original_asis/topology.json \
	$PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/emulated_asis/topology.json \
	$PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/emulated_tobe/topology.json | jq -r '.[] | [ ."node-id", .config ]' | xargs -ICMD echo -e CMD 

