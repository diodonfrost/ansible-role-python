# Check if python is functionnal

python_versions = ['3.5', '3.6', '3.7', '3.8']

control 'java-01' do
  impact 1.0
  title 'Python'
  desc 'Python should be functionnal'
  describe.one do
    python_versions.each do |python_version|
      describe command("/usr/local/python#{python_version}/bin/python#{python_version} --version") do
        its('exit_status') { should eq 0 }
      end
    end
  end
end
