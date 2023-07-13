locals {
  project_name = "dev-env"

  ssh_config_file = {
    windows = "windows-ssh-config.tpl"
    linux   = "linux-ssh-config.tpl"
  }
}