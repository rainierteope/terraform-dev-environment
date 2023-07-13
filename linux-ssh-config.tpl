cat << EOF >> ~/.ssh/config

Host ${hostname}
  Hostname ${ip_address}
  User ${user}
  IdentityFile ${identityfile}
EOF