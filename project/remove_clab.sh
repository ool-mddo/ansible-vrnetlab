source ./.env
cd $LOCALSERVER_HOMEDIR
sudo containerlab destroy --topo /tmp/clab-topo.yml --cleanup

