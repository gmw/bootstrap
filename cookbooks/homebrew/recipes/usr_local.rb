#
# Cookbook Name:: homebrew
# Recipe:: usr_local
#
# Copyright 2012, Ben Bleything <ben@bleything.net>
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

execute "chown" do
  command "sudo chown -R #{ENV['USER']} /usr/local"
  action :nothing
end

execute "sudo mkdir -p /usr/local" do
  not_if { File.exist? "/usr/local" }
  notifies :run, 'execute[chown]', :immediately
end
