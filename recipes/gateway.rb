#
# Cookbook Name:: gateway
# Recipe:: default
#
# Copyright 2013, Static Corp.
#

cloudfoundry_service "hadoop" do
  components ["hadoop_gateway"]
end
