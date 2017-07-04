#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'postgresql-server' do 
    notifies :run, 'execute[postgresql-init]'
end
package 'postgresql' do
    action :install
end

execute 'postgresql-init' do
    command 'postgresql-setup initdb'
    action :nothing
end


service 'postgresql' do
    action [:enable, :start]
end
