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
ansible-vrnetlab$ sudo ansible-runner run . -p playbooks/containerlab.yml --cmdline '-e login_user=XXXXX -e login_pass=XXXXX -e sudo_pass=XXXXX '-vvvv
```
