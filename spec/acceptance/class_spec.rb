require 'spec_helper_acceptance'

describe 'basemodule class' do

  context 'default parameters' do
    it 'should work with no errors' do
      pp = <<-EOS
      include basemodule
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe package('basemodule') do
      it { should be_installed }
    end

    describe file('/etc/basemodule/config.cfg') do
      it { should be_file }
    end

    describe service('basemodule') do
      it { should be_running }
      it { should be_enabled }
    end
  end
end
