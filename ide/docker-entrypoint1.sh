#!/bin/bash
if [ -e /home/${USERNAME}/ ]; then
  sudo chown ${USERNAME}:${GROUPNAME} /home/${USERNAME}
  sudo chown ${USERNAME}:${GROUPNAME} -R /home/${USERNAME}/cloud9/
  node /home/${USERNAME}/cloud9/server.js -l 0.0.0.0 --port 8080 -w /home/${USERNAME}/workspace --auth ${USERNAME}:${PASSWORD}
else
  node /root/cloud9/server.js -l 0.0.0.0 --port 8080 -w /root/workspace --auth ${USERNAME}:${PASSWORD}
fi

history -c
