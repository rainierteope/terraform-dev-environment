add-content -path C:/Users/${user}/.ssh/config -value @'

Host ${hostname}
  HostName ${ip_address}
  User ${user}
  IdentityFile ${identityfile}
'@