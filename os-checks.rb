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

control 'Check NFS Share' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(grep /elk_bkp /etc/fstab | awk '{print $3}') do
   its('stdout') { should match (/["/elk_bkp"]/) }
end
end

control 'Check Size for NFS ' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(grep /elk_bkp /etc/fstab | awk '{print $3}') do
   its('stdout') { should match (/["df -h /elk_bkp | awk '{print $2}' | grep -v Size"]/) }
end
end

control 'Check the size of /data mount point in ELK APM Data Node ' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(grep /elk_bkp /etc/fstab | awk '{print $3}') do
   its('stdout') { should match (/["df -h /data | awk '{print $2}' | grep -v Size"]/) }
end
end

control 'Check if Kibana Service is running ' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(service kibana status | grep -w Active | awk '{print $2}') do
   its('stdout') { should match (/["active"]/) }
end
end


control 'Check the size of /data mount point in ELK APM Data Node ' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(grep /elk_bkp /etc/fstab | awk '{print $3}') do
   its('stdout') { should match (/["df -h /data | awk '{print $2}' | grep -v Size"]/) }
end
end

control 'Check if the proper version of Kibana is installed' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(rpm -qa | grep kibana | xargs rpm -qi | grep Version | awk '{print $3}') do
   its('stdout') { should match (/["7.10.1"]/) }
end
end

control 'Check if Elastic Search Service is running' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(service elasticsearch status | grep -w Active | awk '{print $2}') do
   its('stdout') { should match (/["active"]/) }
end
end

control 'Check if the proper version of Elastic Search Service is installed' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(rpm -qa | grep elasticsearch | xargs rpm -qi | grep Version | awk '{print $3}') do
   its('stdout') { should match (/["7.10.1"]/) }
end
end

control 'Check if APM Server Service is running' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(service apm-server status | grep -w Active | awk '{print $2}') do
   its('stdout') { should match (/["active"]/) }
end
end

control 'Check if the proper version of APM Server Service is installed' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(rpm -qa | grep apm-server | xargs rpm -qi | grep Version | awk '{print $3}') do
   its('stdout') { should match (/["7.10.1"]/) }
end
end

control 'Check if  the APM Load Balancer is deployed and working' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(curl -s -o /dev/null -I -w "%{http_code}\n" http://10.235.224.58:8200\) do
   its('stdout') { should match (/["200 / 401"]/) }
end
end

control 'Check if  the Elastic Search Load Balancer is deployed and working' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(curl -s -o /dev/null -I -w "%{http_code}\n" http://10.235.224.59:9200\) do
   its('stdout') { should match (/["200 / 401"]/) }
end
end

control 'Check if the ELK Application is accessible' do
  impact 1.0                               
  title 'Platform Common Checks'
  desc 'BASE Cecks'
describe command(curl -s -o /dev/null -I -w "%{http_code}\n" https://elk-dc50.cld.ondemand.com/login?next=%2F) do
   its('stdout') { should match (/["200 / 401"]/) }
end
end
