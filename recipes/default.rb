package "apt-cacher-ng"
service "apt-cacher-ng"

template "#{node["apt-cacher-ng"][:confdir]}/acng.conf" do
  source "acng.conf.erb"
  mode "0644"
  notifies :restart, "service[apt-cacher-ng]"
end

node["apt-cacher-ng"][:mappings].each do |mapping|
  if mapping.has_key?(:url_files)
    mapping[:url_files].each do |file|
      file "#{node["apt-cacher-ng"][:confdir]}/#{file[:name]}" do
        content "#{file[:content]}\n"
        mode "0644"
        notifies :restart, "service[apt-cacher-ng]"
      end
    end
  end
end

apt_cacher_ng = if node["apt-cacher-ng"]["encrypted_data_bags"]
  secret = Chef::EncryptedDataBagItem.load_secret(node["apt-cacher-ng"]["secret_file"])
  bag = Chef::EncryptedDataBagItem.load("apt-cacher-ng", "default", secret)
  {user: bag["user"], password: bag["password"]}
else
  {user: node["apt-cacher-ng"]["user"], password: node["apt-cacher-ng"]["password"]}
end

template "#{node["apt-cacher-ng"][:confdir]}/security.conf" do
  source "security.conf.erb"
  owner "apt-cacher-ng"
  group "apt-cacher-ng"
  mode "0600"
  notifies :restart, "service[apt-cacher-ng]", :immediately
  variables user: apt_cacher_ng[:user],
    password: apt_cacher_ng[:password]
end

