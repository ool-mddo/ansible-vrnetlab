#source ./.env
source ../../.env

rm -rf $DEMO_DIR/emulated_asis/configs/*conf
rm -rf $DEMO_DIR/emulated_tobe/configs/*conf
cp playbooks/Seg*conf $DEMO_DIR/emulated_asis/configs/
cp playbooks/Seg*conf $DEMO_DIR/emulated_tobe/configs/


cd $DEMO_DIR/emulated_asis/configs
DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME; ls $DIR/*/config | grep region | rev | cut -d "/" -f 2 | rev | xargs -INAME bash -c "cat $DIR/NAME/config/juniper.conf > NAME.conf"

cd $DEMO_DIR/emulated_tobe/configs
DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME; ls $DIR/*/config | grep region | rev | cut -d "/" -f 2 | rev | xargs -INAME bash -c "cat $DIR/NAME/config/juniper.conf > NAME.conf"

cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp bundle exec rake NETWORK=mddo-ospf
