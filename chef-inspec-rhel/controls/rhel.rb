kernel_params = yaml(content:inspec.profile.file('kernel_common_params.yml')).params
control 'kernel_tuning' do
    impact 'high'
    title 'Kernel run params'
    desc 'Check kernel tuning params'
    kernel_params['sysctl'].each do |param, expected_val|
      describe kernel_parameter("#{param}") do
          its('value') { should eq expected_val }
      end
    end
end
