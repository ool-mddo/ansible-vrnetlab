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

### multi Region config generate

```
cd {cloneDir}/ansible-vrnetlab/project
sudo ansible-runner run . -p playbooks/generate_config_Region[ABCDE...].yml -vvv

```

