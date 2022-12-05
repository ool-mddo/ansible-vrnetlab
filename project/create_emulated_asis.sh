source ../demo_vars
#source ../../.env

rm -rf $DEMO_DIR/emulated_asis/configs/*conf
rm -rf $DEMO_DIR/emulated_tobe/configs/*conf
cp playbooks/Seg*conf $DEMO_DIR/emulated_asis/configs/
cp playbooks/Seg*conf $DEMO_DIR/emulated_tobe/configs/


curl -X 'POST'   'http://localhost:1880/batfish_l1topo'   -H 'accept: application/json'   -H 'Content-Type: application/json'  --data @playbooks/pushed_configs_mddo_network.json >  $DEMO_DIR/emulated_asis/batfish/layer1_topology.json
curl -X 'POST'   'http://localhost:1880/batfish_l1topo'   -H 'accept: application/json'   -H 'Content-Type: application/json'  --data @playbooks/pushed_configs_mddo_network.json >  $DEMO_DIR/emulated_tobe/batfish/layer1_topology.json
cd $DEMO_DIR/emulated_asis/configs

DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME; ls $DIR/*/config | grep region | rev | cut -d "/" -f 2 | rev | xargs -INAME bash -c "cat $DIR/NAME/config/juniper.conf > NAME.conf"

cd $DEMO_DIR/emulated_tobe/configs
DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME; ls $DIR/*/config | grep region | rev | cut -d "/" -f 2 | rev | xargs -INAME bash -c "cat $DIR/NAME/config/juniper.conf > NAME.conf"

cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp bundle exec rake NETWORK=${NETWORK_NAME} PHY_SS_ONLY=1
