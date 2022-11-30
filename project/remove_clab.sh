#source ./.env
source ../../.env
rm -f ./playbooks/pushed_configs_mddo_network.json
rm -f ./playbooks/*conf
rm -f ./playbooks/clab-topo.yml
cd $LOCALSERVER_HOMEDIR
sudo containerlab destroy --topo /tmp/clab-topo.yml --cleanup
sudo rm -f /tmp/*conf
sudo rm -f /tmp/clab-topo.yml
