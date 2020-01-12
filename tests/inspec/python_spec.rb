# Check if python is functionnal

python_path = '/usr/local/bin/python3 --version'

control 'java-01' do
  impact 1.0
  title 'Python'
  desc 'Python should be functionnal'
  describe command(python_path) do
    its('exit_status') { should eq 0 }
  end
end
