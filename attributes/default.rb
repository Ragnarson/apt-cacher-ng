default["apt-cacher-ng"][:confdir] = "/etc/apt-cacher-ng"

default["apt-cacher-ng"][:cachedir] = "/var/cache/apt-cacher-ng"
default["apt-cacher-ng"][:logdir] = "/var/log/apt-cacher-ng"
default["apt-cacher-ng"][:port] = "3142"
default["apt-cacher-ng"][:reportpage] = "acng-report.html"
default["apt-cacher-ng"][:extreshold] = 4
default["apt-cacher-ng"][:mappings] = [
  {
    :name => "debrep",
    :value => "file:deb_mirror*.gz /debian ; file:backends_debian",
  },
  {
    :name => "uburep",
    :value => "file:ubuntu_mirrors /ubuntu ; file:backends_ubuntu",
  },
  {
    :name => "debvol",
    :value => "file:debvol_mirror*.gz /debian-volatile ; file:backends_debvol",
  },
  {
    :name => "cygwin",
    :value => "file:cygwin_mirrors /cygwin",
  },
  {
    :name => "sfnet",
    :value => "file:sfnet_mirrors",
  },
  {
    :name => "alxrep",
    :value => "file:archlx_mirrors /archlinux",
  },
  {
    :name => "fedora",
    :value => "file:fedora_mirrors",
  },
  {
    :name => "epel",
    :value => "file:epel_mirrors",
  },
  {
    :name => "slrep",
    :value => "file:sl_mirrors",
  },
]

