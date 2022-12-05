#source ./.env
source ../demo_vars


cd $DEMO_DIR/emulated_tobe/configs
DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME; ls $DIR/*/config | grep region | rev | cut -d "/" -f 2 | rev | xargs -INAME bash -c "cat $DIR/NAME/config/juniper.conf > NAME.conf"

cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp bundle exec rake NETWORK=$NETWORK_NAME  PHY_SS_ONLY=1

