source ../demo_vars
#source ../../.env

rm -rf $DEMO_DIR/emulated_asis/configs/*
rm -rf $DEMO_DIR/emulated_tobe/configs/*
rm -rf $DEMO_DIR/emulated_asis/hosts/*
rm -rf $DEMO_DIR/emulated_tobe/hosts/*
cp playbooks/Seg*conf $DEMO_DIR/emulated_asis/configs/
cp playbooks/Seg*conf $DEMO_DIR/emulated_tobe/configs/

original_asis=`curl ${NETOVIZ_URL}/model/${NETWORK_NAME}/original_asis/topology.json`
curl -X 'POST'   'http://localhost:1880/batfish_l1topo'   -H 'accept: application/json'   -H 'Content-Type: application/json'  --data "$original_asis" > $DEMO_DIR/emulated_asis/batfish/layer1_topology.json
curl -X 'POST'   'http://localhost:1880/batfish_l1topo'   -H 'accept: application/json'   -H 'Content-Type: application/json'  --data "$original_asis" > $DEMO_DIR/emulated_tobe/batfish/layer1_topology.json

cd $DEMO_DIR/emulated_asis/configs
DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME; ls $DIR/*/config | grep region | rev | cut -d "/" -f 2 | rev | xargs -INAME bash -c "cat $DIR/NAME/config/juniper.conf > NAME.conf"

cd $DEMO_DIR/emulated_tobe/configs
DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME; ls $DIR/*/config | grep region | rev | cut -d "/" -f 2 | rev | xargs -INAME bash -c "cat $DIR/NAME/config/juniper.conf > NAME.conf"

cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp bundle exec rake NETWORK=${NETWORK_NAME} PHY_SS_ONLY=1 
