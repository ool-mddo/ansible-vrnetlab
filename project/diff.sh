source ../../.env


cd $MODEL_MERGE_DIR/model_merge
python3.10 merge.py config $PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/original_asis/topology.json $PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/emulated_asis/topology.json $PLAYGROUND_DIR/netoviz_model/$NETWORK_NAME/emulated_tobe/topology.json | jq '.[].config' | xargs -ICMD echo -e CMD

