#
# Cookbook Name:: hadoop
# Recipe:: default
#
# Copyright 2013, Static Corp.
#

node[:hadoop][:supported_versions].each do |version, install_version|
  Chef::Log.info("Building hadoop version: #{version} - #{install_version}")

  hadoop_tarball = File.join(node[:deployment][:setup_cache], "hadoop-#{install_version}-bin.tar.gz")
  remote_file hadoop_tarball do
    source "http://apache.claz.org/hadoop/core/hadoop-1.1.2/hadoop-1.1.2-bin.tar.gz"
    owner node[:deployment][:user]
    action :create_if_missing
  end

  bash "Install hadoop" do
    cwd File.join("", "tmp")
    user node[:deployment][:user]
    code <<-EOH
  mkdir -p #{node[:hadoop][:path]}
  tar xzf #{hadoop_tarball}
  cp -r hadoop-#{install_version}/* #{node[:hadoop][:path]}/
  EOH
  end

  bash "Generate SSH key" do
    cwd ENV["HOME"]
    user node[:deployment][:user]
    code <<-EOH
  ssh-keygen -t dsa -f ~/.ssh/id_dsa -P '' -q
  cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
  ssh-keyscan -H #{node[:hadoop][:host]} >> ~/.ssh/known_hosts
  EOH
  end

 bash "Set JAVA_HOME" do
   cwd ENV["HOME"]
   user node[:deployment][:user]
   code <<-EOH
  echo "export JAVA_HOME=#{node[:java6][:java_home]}" >> .profile
  EOH
  end

end
