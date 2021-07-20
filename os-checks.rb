control 'Check CPU' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'

describe command('grep -i processor /proc/cpuinfo | cut -f2 -d :') do
   its('stdout') { should match (/[0]/) }
 end
end

control 'Check Memory' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command('grep -i MemTotal /proc/meminfo | cut -f2 -d :') do
   its('stdout') { should match (/[667984]/) }
end
end

control 'Check OS Version' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command('grep -i PRETTY_NAME /etc/os-release | cut -f2 -d =') do
   its('stdout') { should match (/["CentOS Linux 7 (Core)"]/) }
end
end
