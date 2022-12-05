source ../demo_vars
#source ../../.env
rm -f $ANSIBLE_RUNNER_DIR/project/playbooks/pushed_configs_mddo_network.json
rm -f $ANSIBLE_RUNNER_DIR/project/playbooks/*conf
rm -f $ANSIBLE_RUNNER_DIR/project/playbooks/clab-topo.yml
cd $LOCALSERVER_HOMEDIR
sudo containerlab destroy --topo /tmp/clab-topo.yml --cleanup
sudo rm -f /tmp/*conf
sudo rm -f /tmp/clab-topo.yml
