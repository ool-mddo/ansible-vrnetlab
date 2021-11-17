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

