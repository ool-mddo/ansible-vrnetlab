#source ./.env
source ../demo_vars


cd $DEMO_DIR/emulated_tobe/configs
#DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME;  find  $DIR/*/config  -name juniper.conf 
DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME;  find  $DIR/*/config  -name juniper.conf | rev | cut -d "/" -f 3 | rev 
#DIR=$LOCALSERVER_HOMEDIR/clab-$LABNAME; ls $DIR/*/config | grep -e "juniper.conf" | rev | cut -d "/" -f 2 | rev 
