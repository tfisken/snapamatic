override['uwsgi']['pip_options'] = '--index=https://pypi.gannettdigital.com/simple/'
override['uwsgi']['version'] = '2.0.8.1'
override['uwsgi']['cheap'] = false
override['uwsgi']['workers'] = '2'
override['uwsgi']['dogstatsd'] = true

override['runit']['use_package_from_yum'] = true

override['nginx']['default_site_enabled'] = false
override['nginx']['version'] = (node['platform_family'] == 'rhel' && node['platform_version'].to_f >= 7 ? '1.8.0-1' : '1.6.2')

override['nginx']['version_page'] = false

override['python-deployment']['application']['name'] = 'snap-a-matic-15000'
override['python-deployment']['application']['settings'] = 'settings_snap-a-matic-15000'
override['python-deployment']['application']['additional_settings'] = true
override['python-deployment']['application']['config_location'] = 'remote'
override['python-deployment']['application']['framework'] = 'django'
override['python-deployment']['application']['sitemap'] = true
override['python-deployment']['repository'] = 'https://pypi.gannettdigital.com'
override['python-deployment']['uwsgi-application'] = true
# shouldn't need to override pip-options but the repository override isn't working
override['python-deployment']['pip-options'] = '--index-url https://pypi.gannettdigital.com/simple/ \
--timeout 30 --retries 15 --trusted-host pypi.gannettdigital.com'

override['python']['version'] = (node['platform_family'] == 'rhel' && node['platform_version'].to_f >= 7 ? '2.7.10-1.el7.centos.gd' : '2.7.10-1.el6.gd')
override['python']['install_method'] = 'custom-package'
override['python']['virtualenv_version'] = '13.1.2'

override['appdynamics']['python_agent']['version'] = '4.1.4.0'

override['opsmatic']['groups'] = %w('uwsgi')

override['datadog']['nginx']['instances'] = [{ 'nginx_status_url' => 'http://localhost:8090/nginx_status/' }]
normal['datadog']['process']['instances'] += [
  { 'exact_match' => 'False', 'name' => 'uwsgi', 'search_string' => ['uwsgi'] },
  { 'exact_match' => 'False', 'name' => 'nginx', 'search_string' => ['nginx'] },
  { 'exact_match' => 'False', 'name' => 'appdynamics', 'search_string' => ['appdynamics_bindeps/proxy'] }
]
normal['splunk']['cookbook'] = 'chef-splunk'
normal['splunk']['apps'] += [
  {
    name: 'nginxlogs_inputs', version: '0.0.2'
  },
  {
    name: 'uwsgilogs_inputs', version: '0.0.1'
  }
]

override['sysctl']['params']['net']['ipv4']['tcp_max_syn_backlog'] = '2048'
override['sysctl']['params']['net']['ipv4']['tcp_keepalive_intvl'] = '15'
override['sysctl']['params']['net']['ipv4']['tcp_keepalive_probes'] = '3'
override['sysctl']['params']['net']['ipv4']['tcp_keepalive_time'] = '90'
override['sysctl']['params']['net']['ipv4']['tcp_fin_timeout'] = '30'
override['sysctl']['params']['net']['core']['somaxconn'] = '10240'

default['splunk']['user'] = {
  'username' => 'splunk',
  'comment'  => 'Splunk Server',
  'home'     => '/opt/splunkforwarder',
  'shell'    => '/bin/bash',
  'uid'      => 396
}
