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

describe file('/etc/profile') do
#  its(:content) { should match /TMOUT=900/ }
#  its(:content) { should match /readonly TMOUT/ }
  its(:content) { should match /HISTSIZE=1000/ }
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

# HanaDB Kernel Parameters

describe file('/etc/sysctl.conf') do
  its(:content) { should match /net.ipv4.tcp_slow_start_after_idle=0/ }
  its(:content) { should match /net.core.rmem_max=16777216/ }
  its(:content) { should match /net.core.wmem_max=16777216/ }
  its(:content) { should match /net.core.rmem_default=262144/ }
  its(:content) { should match /net.core.wmem_default=262144/ }
  its(:content) { should match /net.core.optmem_max=16777216/ }
  its(:content) { should match /net.core.netdev_max_backlog=300000/ }
  its(:content) { should match /net.ipv4.tcp_rmem=65536 16777216 16777216/ }
  its(:content) { should match /net.ipv4.tcp_wmem=65536 16777216 16777216/ }
  its(:content) { should match /net.ipv4.tcp_no_metrics_save=1/ }
  its(:content) { should match /net.ipv4.tcp_moderate_rcvbuf=1/ }
  its(:content) { should match /net.ipv4.tcp_window_scaling=1/ }
  its(:content) { should match /net.ipv4.tcp_timestamps=1/ }
  its(:content) { should match /net.ipv4.tcp_sack=1/ }
  its(:content) { should match /sunrpc.tcp_slot_table_entries=128/ }
end

#MYSQL Kernel Parameters
describe file('/etc/sysctl.conf') do
  its(:content) { should match /net.ipv4.tcp_slow_start_after_idle=0/ }
  its(:content) { should match /net.core.rmem_max=16777216/ }
  its(:content) { should match /net.core.wmem_max=16777216/ }
  its(:content) { should match /net.core.rmem_default=262144/ }
  its(:content) { should match /net.core.wmem_default=262144/ }
  its(:content) { should match /net.core.optmem_max=16777216/ }
  its(:content) { should match /net.core.netdev_max_backlog=300000/ }
  its(:content) { should match /net.ipv4.tcp_rmem=65536 16777216 16777216/ }
  its(:content) { should match /net.ipv4.tcp_wmem=65536 16777216 16777216/ }
  its(:content) { should match /net.ipv4.tcp_no_metrics_save=1/ }
  its(:content) { should match /net.ipv4.tcp_moderate_rcvbuf=1/ }
  its(:content) { should match /net.ipv4.tcp_window_scaling=1/ }
  its(:content) { should match /net.ipv4.tcp_timestamps=1/ }
  its(:content) { should match /net.ipv4.tcp_sack=1/ }
  its(:content) { should match /sunrpc.tcp_slot_table_entries=128/ }
end

