Description
===========

Installs and configures [apt-cacher-ng](http://www.unix-ag.uni-kl.de/~bloch/acng/).

Requirements
============

## Platforms

* Debian, Ubuntu

Tested on:

* Debian Wheezy (7.0)

Attributes
==========

## Suggested

* `node["apt-cacher-ng"][:user]`     - administration panel login
* `node["apt-cacher-ng"][:password]` - administration panel password

Following attribute lets us create [URL mappings](http://www.unix-ag.uni-kl.de/~bloch/acng/html/config-serv.html#repmap).

* `node["apt-cacher-ng"][:mappings]`

Full syntax:

```ruby
"apt-cacher-ng" => {
  :mappings => [
    {
      :name => "debrep",
      :value => "file:deb_mirror*.gz /debian ; file:backends_debian",
      :url_files => [
        {
          :name => "backends_debian",
          :content => "http://ftp.de.debian.org/debian"
        }
      ]
    }
  ]
}
```

Chef will create an entry in `acng.conf`:

```
Remap-debrep: file:deb_mirror*.gz /debian ; file:backends_debian
```

and file ```backends_debian``` with content ```http://ftp.de.debian.org/debian```.

## Optional

Check `templates/default/acng.conf.erb` for more details.

Usage
=====

## Server side

Add `recipe[apt-cacher-ng]` to run list or create a role and change desired attributes.

```ruby
name "apt-cacher-ng"
description %q{
  Configures apt-cacher-ng on node.
}

run_list(
  "recipe[apt-cacher-ng]"
)

override_attributes(
  "apt-cacher-ng" =>
    {
      :user => "my_user",
      :password => "my_password"
    }
)
```
## Client side

http://www.unix-ag.uni-kl.de/~bloch/acng/html/config-servquick.html#config-client

