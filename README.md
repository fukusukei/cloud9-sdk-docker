# This repository contains Dockerfile of Cloud9 IDE .

## Docker building.

```bash
# value setting 
export http_proxy=${http_proxy}
export https_proxy=${https_proxy}
export no_proxy=${no_proxy}
export USERNAME=${your_name}
export PASSWORD=${basic_auth_password}
export GROUPNAME=${USERNAME}
export CLOUD9_EXTERNAL_PORT=${your_any_port}
export MOUNT_HOST_PATH=${your_host_any_path}

# building
docker-compose -f docker-compose.yml build
```

## Usage
```bash
docker-compose -f docker-compose.yml up -d
```