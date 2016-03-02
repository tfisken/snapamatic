#
# Cookbook Name:: snapa
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'gdp-base-linux'
include_recipe 'uwsgi-application'
include_recipe 'couchbase::client'
