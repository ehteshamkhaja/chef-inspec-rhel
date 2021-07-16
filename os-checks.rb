describe command('grep -i processor /proc/cpuinfo | cut -f2 -d :') do
   its('stdout') { should match (/[0]/) }
end

describe command('grep -i MemTotal /proc/meminfo | cut -f2 -d :') do
   its('stdout') { should match (/[667984]/) }
end

describe command('grep -i PRETTY_NAME /etc/os-release | cut -f2 -d =') do
   its('stdout') { should match (/["CentOS Linux 7 (Core)"]/) }
end
