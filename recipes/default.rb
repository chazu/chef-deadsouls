# Cookbook Name:: .
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

package "p7zip-full"

cookbook_file "/tmp/ds3.6.zip" do
  source "files/ds3.6.zip"
  owner "root"
  group "root"
  not_if { File.exists? "/tmp/ds3.6.zip" }
end

execute "cd /tmp && wget http://lpmuds.net/files/deadsouls/ds3.6.zip" do
  user "root"
  not_if { File.exists? "/tmp/ds3.6.zip" }
end

execute "cd /tmp && 7z x ds3.6.zip -o/srv/ds" do
  user "root"
  not_if { File.exists? "/srv/ds" }
end

execute "cd srv/ds/ds3.6/fluffos-2.23-ds01 && ./configure" do
  user "root"
end

execute "cd /srv/ds/ds3.6/fluffos-2.23-ds01 && make install" do
  user "root"
end

template "/srv/ds/ds3.6/bin/start" do
  source "start.erb"
  owner "root"
  group "root"
  mode "0777"
end
