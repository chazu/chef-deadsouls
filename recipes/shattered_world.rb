# Cookbook Name:: .
# Recipe:: Shattered World
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

package "p7zip-full"

cookbook_file "/tmp/swlpc-2.0.6mlib.tar.gz" do
  source "swlpc-2.0.6mlib.tar.gz"
  owner "root"
  group "root"
  not_if { File.exists? "/tmp/swlpc-2.0.6mlib.tar.gz" }
end

execute "cd /tmp && 7z x swlpc-2.0.6mlib.tar.gz -o/srv/sw" do
  user "root"
  not_if { File.exists? "/srv/sw" }
end

execute "cd /srv/sw && tar -xvf kjzygb.tar" do
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
