# autoware_build_env

Build Environment for Autoware

## Usage

### Local Installation

```sh
./setup.sh
```

Or if you'd like to run a specific role,

```sh
ansible-playbook -i hosts.yml autoware_build_env.yml --ask-become-pass --tags autoware
```

### Building Docker Image

```sh
docket build .
```
