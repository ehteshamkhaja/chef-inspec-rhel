control "world-1.0" do
  impact 1.0
  title "Hello World"
  desc "Text should include words Hello world"
  describe file('hello.txt') do 
    its('content') { should match 'Hello World'}
  end
end

describe file('/etc/sysconfig/network-scripts/ifcfg-eth0') do 
  its(:content) { should match /TYPE=Ethernet/ }
  its(:content) { should match /BOOTPROTO=static/ }
  its(:content) { should match /ONBOOT=yes/ }
end

# Service checks

describe service('firewalld') do
  it { should be_enabled }
  it { should be_running }
end

#User checks

describe user('root') do
  it { should exist }
end

describe user('mysql') do
 it { should_not exist }
end

describe user('oracle') do
 it { should_not exist }
end

