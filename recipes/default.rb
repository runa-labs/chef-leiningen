#
# Cookbook Name:: leiningen
# Recipe:: default
#
# Copyright 2010, Runa Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
remote_file "/usr/local/bin/lein" do
  source "https://github.com/technomancy/leiningen/blob/5eaad5c48db0668d773e6e964bdb64c30116c370/bin/lein"
  mode "755"
  owner "root"
  group "root"
  backup false
end

execute "lein_self_install" do
  command "export LEIN_ROOT=1; lein self-install"
  user   node[:lein][:user] 
  group  node[:lein][:group]
  environment ({"HOME" => node[:lein][:home]})
  not_if{ File.exists?("#{node[:lein][:home]}/.lein/self-installs/leiningen-1.7.1-standalone.jar") }
end

