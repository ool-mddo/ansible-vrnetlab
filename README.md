# ansible-vrnetlab

### How to get junos config
```
$ ansible-playbook -i inventory/hosts project/playbooks/output.yml -vvvv
```

```
$ ansible-runner run . -p playbooks/junos.yml  -vvvv
```

### How to get and save all configs

```
$ ansible-playbook -i inventory/hosts project/playbooks/get_config.yml
```

### ansible-runner & overlay network version

```
sudo ansible-runner run . -p playbooks/get_config_runner.yml --container-option="--net=my-multihost-network" -vvvv

```

### containerlab deploy playbook
```
cd ansible-vrnetlab
ansible-vrnetlab$ sudo ansible-runner run . -p playbooks/containerlab.yml --cmdline '-e login_user=XXXXX -e login_pass=XXXXX -e sudo_pass=XXXXX '-vvvv
```
### mddo layer3 topology model deploy
```
cd ansible-vrnetlab
cd project
sudo ansible-runner run . -p playbooks/generate_topo_layer3.yml
sudo ansible-runner run . -p playbooks/generate_config_layer3.yml
cd ../
sudo ansible-runner run . -p playbooks/mddo-containerlab.yml --cmdline '-e login_user=ubuntu -e login_pass=ubuntu -e sudo_pass=ubuntu -e operation=create '-vvvv
###nodered version
cd ansible-vrnetlab
cd project
 sudo ansible-runner run . -p playbooks/generate_topo_layer3_nodered.yml --container-option='--net=nodered_node-red-net' --cmdline '-e nodered_url=http://192.168.x.x:1880'

 sudo ansible-runner run . -p playbooks/generate_config_layer3-nodered.yml --container-option='--net=nodered_node-red-net' --cmdline '-e nodered_url=http://192.168.x.x:1880'


```

### mddo layer3 topology model destroy
```
sudo ansible-runner run . -p playbooks/mddo-containerlab.yml --cmdline '-e login_user=ubuntu -e login_pass=ubuntu -e sudo_pass=ubuntu -e operation=delete '-vvvv
```
