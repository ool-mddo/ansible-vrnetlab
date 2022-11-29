source ./.env

### run deploy containerlab 
RUN_DEPLOY_CLAB="sudo ansible-runner run . -p /data/playbooks/mddo-containerlab.yml --container-volume-mount=\"${PWD}:/data\" --container-image=${ANSIBLERUNNER_IMAGE}:latest --process-isolation --process-isolation-executable docker --cmdline '-e login_user=${LOCALSERVER_USER} -e login_pass=${LOCALSERVER_PASSWD} -e sudo_pass=${LOCALSERVER_SUDO} -e operation=save '"
eval $RUN_DEPLOY_CLAB


cd $DEMO_DIR/emulated_tobe/configs
DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME; ls $DIR/*/config | grep region | rev | cut -d "/" -f 2 | rev | xargs -INAME bash -c "cat $DIR/NAME/config/juniper.conf > NAME.conf"

cd $PLAYGROUND_DIR
sudo docker-compose run netomox-exp bundle exec rake NETWORK=mddo-ospf


cd $MODEL_MERGE_DIR/model_merge
python3 merge.py config $PLAYGROUND_DIR/netoviz_model/mddo-ospf/original_asis/topology.json $PLAYGROUND_DIR/netoviz_model/mddo-ospf/emulated_asis/topology.json $PLAYGROUND_DIR/netoviz_model/mddo-ospf/emulated_tobe/topology.json

