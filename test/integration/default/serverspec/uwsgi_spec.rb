require_relative 'spec_helper'

describe command("/usr/local/bin/uwsgi --version") do
    its(:stdout) { should contain "#{$node['uwsgi']['version']}" }
end

describe package('pcre-devel') do
  it { should be_installed }
end

describe package('libyaml') do
  it { should be_installed }
end

describe user('uwsgi') do
  it { should exist }
  it { should have_login_shell '/bin/false' }
end

describe file('/var/log/uwsgi') do
  it { should exist }
  it { should be_directory }
  it { should be_mode 775 }
  it { should be_owned_by 'nobody' }
  it { should be_grouped_into 'root' }
end

describe file("/etc/uwsgi") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file("/etc/uwsgi/conf") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file("/etc/uwsgi/siteconf") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file("/etc/uwsgi/appconf") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file("/etc/uwsgi/reload") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/opt/uwsgi') do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'nobody' }
  it { should be_grouped_into 'nobody' }
end

describe file('/opt/uwsgi/stats') do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'nobody' }
  it { should be_grouped_into 'nobody' }
end

describe file('/opt/uwsgi/tb') do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'nobody' }
  it { should be_grouped_into 'nobody' }
end

describe file('/usr/bin/uwsgi') do
  it { should be_linked_to '/usr/local/bin/uwsgi' }
end

describe file('/etc/logrotate.d/uwsgi') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain '/var/log/uwsgi/*log {' }
  it { should contain 'copytruncate' }
  it { should contain 'daily' }
  it { should contain 'rotate 10' }
  it { should contain 'missingok' }
  it { should contain 'notifempty' }
  it { should contain 'compress' }
  it { should contain 'sharedscripts' }
  it { should contain '/var/log/uwsgi/*log.1 {' }
  it { should contain 'copytruncate' }
  it { should contain 'daily' }
  it { should contain 'rotate 10' }
  it { should contain 'missingok' }
  it { should contain 'notifempty' }
  it { should contain 'compress' }
  it { should contain 'sharedscripts' }
end


describe command("pip list") do
  its(:stdout) { should contain "uWSGI" }
  its(:exit_status) { should eq 0 }
end

describe file('/etc/init.d/uwsgi') do
  it { should exist }
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain 'UWSGI="/usr/bin/uwsgi"' }
  it { should contain 'prog="uwsgi"' }
  it { should contain "UWSGI_INI=\"/etc/uwsgi/uwsgi.ini\"" }
  it { should contain "UWSGI_LOG_DIR=\"/var/log/uwsgi\"" }
end

describe service('uwsgi') do
  it { should be_enabled }
  it { should be_running }
end
