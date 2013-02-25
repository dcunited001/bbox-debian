BBox Debian 6.0.6
==============
BBox is short for Base-Box or Bento-Box.  Based on bento,
but not intended to use chef or puppet.  Just shell scripts,
though it does have chef-client installed.

I'm building this box on top of a Debian 6.0.6 basebox
The basebox was build from the VeeWee 6.0.5 template,
using the 6.0.6 iso.  see my quick bento fork for the
basebox template and a link to the iso.

### Set up configuration in config/vagrant/defaults.yml
- this is a yaml file with the most common config values
- can be tweaked to support multiple vms.  it's just yaml.

### Set up custom setup scripts to run after main install
- update the post-build script in definitions/debian6.0.6/bbox.sh
- if you want this saved in git, then remove it from .gitignore
- or just use chef/puppet.  but this requires neither.

### How to build baseboxes (view README.md)
- https://github.com/dcunited001/veewee_arch-2012.10.06
- for Ubuntu/Debian, don't select DVD as a package repository source

### Bento
- https://github.com/dcunited001/bento

### Reference for vagrant config commands
- https//github.com/dcunited001/vagrant_chef

### Setting a shared folder:
- You can set folders to be shared with NFS (or other services)
- shared across the host and guest
- Develop on your host while you run the services on your guest.
- Run guard on host while services are run on guest.
- Configure the shared folder locations in defaults.yml and Vagrantfile.

More Resources
==============

#### provisioning vagrant boxes with chef
> http://docs.vagrantup.com/v1/docs/provisioners/chef_server.html

#### manage dns for vagrant hosts/guests
> https://github.com/mosaicxm/vagrant-hostmaster

#### vagrantfile example in Cuken gem specs
> https://github.com/hedgehog/cuken/blob/master/features/chef_examples/zenoss_example/01_chef_server_setup.feature

#### server-bootstrap. hmmm...
> https://github.com/masterexploder/server-bootstrap

#### chef hatch repo
> https://github.com/xdissent/chef-hatch-repo

Loading Dotfiles:
=================

```ruby
#http://www.without-brains.net/blog/2012/08/12/add-your-own-customization-to-vagrant-boxes/
Vagrant::Config.run do |config|
  config.vm.share_folder "v-dotfiles", "/home/vagrant/.dotfiles", File.expand_path("~/.dotfiles")
  config.vm.provision :shell, :path => File.join(File.dirname(__FILE__), "scripts", "provision")
end
```

```shell
#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
apt-get update > /dev/null
apt-get -y install tmux vim zsh git-core
su -c "cd /home/vagrant/.dotfiles && ./setup" vagrant
```

Virtual Box Customization Options
=================================

```ruby
conf.customize do |cvm|
  cvm.memory_size = 1024
  cvm.vram_size = 12
  cvm.cpu_count = 2
  cvm.accelerate_3d_enabled = false
  cvm.accelerate_2d_video_enabled = false
  cvm.monitor_count = 1

  cvm.bios.acpi_enabled = true
  cvm.bios.io_apic_enabled = false

  cvm.cpu.pae = true

  cvm.hw_virt.enabled = false
  cvm.hw_virt.nested_paging = false
  # STORAGE
end
```
