# Cookbook Name:: .
# Recipe:: Discworld
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

package "p7zip-full"

cookbook_file "/tmp/dw_fluffy_r9.99.tar.gz" do
  source "dw_fluffy_r9.99.tar.gz"
  owner "root"
  group "root"
  not_if { File.exists? "/tmp/dw_fluffy_r9.99.tar.gz" }
end

execute "cd /tmp && 7z x dw_fluffy_r9.99.tar.gz -o/srv/dw" do
  user "root"
  not_if { File.exists? "/srv/dw" }
end

execute "cd /srv/dw && tar -xvf dw_fluffy_r9.99.tar" do
  user "root"
end

# execute "cd srv/ds/ds3.6/fluffos-2.23-ds01 && ./configure" do
#   user "root"
# end

# execute "cd /srv/ds/ds3.6/fluffos-2.23-ds01 && make install" do
#   user "root"
# end

# template "/srv/ds/ds3.6/bin/start" do
#   source "start.erb"
#   owner "root"
#   group "root"
#   mode "0777"
# end
