# encoding: utf-8
require 'spec_helper'

describe 'snap-a-matic-15000::default' do
  context 'centos-6.7' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.7') do |node|
        stub_data_bag_item("ux-settings", "secrets").and_return('../data_bags/ux-settings/secrets.json')
        stub_data_bag_item("users", "fhanson").and_return('../data_bags/users/fhanson.json')
        stub_data_bag_item("users", "akemner").and_return('../data_bags/users/akemner.json')
        stub_data_bag_item("users", "blieberman").and_return('../data_bags/users/blieberman.json')
        stub_data_bag_item("users", "jcrawford").and_return('../data_bags/users/jcrawford.json')
        stub_data_bag_item("users", "jneves").and_return('../data_bags/users/jneves.json')
        stub_data_bag_item("users", "rgindes").and_return('../data_bags/users/rgindes.json')
        stub_data_bag_item("users", "nessus").and_return('../data_bags/users/nessus.json')
        stub_data_bag_item("users", "test").and_return('../data_bags/users/test.json')
        stub_command('which sudo').and_return('/usr/bin/sudo')
        stub_command('which nginx').and_return('/usr/bin/nginx')
        stub_command("rpm -q datadog-agent-base").and_return('datadog-agent-base')
      end.converge(described_recipe)
    end

    it 'includes the `gdp-base-linux` recipe' do
      expect(chef_run).to include_recipe('gdp-base-linux')
    end
    it 'includes the `couchbase::client` recipe' do
      expect(chef_run).to include_recipe('couchbase::client')
    end

    it 'includes the `uwsgi-application` recipe' do
      expect(chef_run).to include_recipe('uwsgi-application')
    end
  end

context 'centos-7.1' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.1.1503') do |node|
        stub_data_bag_item("ux-settings", "secrets").and_return('../data_bags/ux-settings/secrets.json')
        stub_data_bag_item("users", "fhanson").and_return('../data_bags/users/fhanson.json')
        stub_data_bag_item("users", "akemner").and_return('../data_bags/users/akemner.json')
        stub_data_bag_item("users", "blieberman").and_return('../data_bags/users/blieberman.json')
        stub_data_bag_item("users", "jcrawford").and_return('../data_bags/users/jcrawford.json')
        stub_data_bag_item("users", "jneves").and_return('../data_bags/users/jneves.json')
        stub_data_bag_item("users", "rgindes").and_return('../data_bags/users/rgindes.json')
        stub_data_bag_item("users", "nessus").and_return('../data_bags/users/nessus.json')
        stub_data_bag_item("users", "test").and_return('../data_bags/users/test.json')
        stub_command('which sudo').and_return('/usr/bin/sudo')
        stub_command('which nginx').and_return('/usr/bin/nginx')
        stub_command("rpm -q datadog-agent-base").and_return('datadog-agent-base')
      end.converge(described_recipe)
    end

  it 'includes the `gdp-base-linux` recipe' do
    expect(chef_run).to include_recipe('gdp-base-linux')
  end

  it 'includes the `couchbase::client` recipe' do
    expect(chef_run).to include_recipe('couchbase::client')
  end

  it 'includes the `uwsgi-application` recipe' do
    expect(chef_run).to include_recipe('uwsgi-application')
  end
end
end
