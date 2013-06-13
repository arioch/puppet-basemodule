require 'spec_helper'

describe 'basemodule', :type => :class do
  let(:pre_condition) { '$concat_basedir = "/tmp"' }
  let (:params) {
    {
      :config_dir => '/etc/basemodule',
      :config_file => '/etc/basemodule/config.cfg'
    }
  }

  describe 'on Debian without parameters' do
    let (:facts) { debian_facts }

    it { should create_class('basemodule') }
    it { should include_class('basemodule::install') }
    it { should include_class('basemodule::config') }
    it { should include_class('basemodule::service') }

    it { should contain_package('basemodule').with_ensure('present') }
    it { should contain_file('/etc/basemodule').with_ensure('directory') }

    it { should contain_service('basemodule').with(
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasrestart' => 'true'
      )
    }
  end

  describe 'on Debian with parameter: config_file' do
    let (:facts) { debian_facts }
    let (:params) { { :config_file => '_VALUE_' } }

    it { should contain_file('_VALUE_').with_ensure('present') }
  end

  describe 'on Debian with parameter: config_file_mode' do
    let (:facts) { debian_facts }
    let (:params) { { :config_file_mode => '_VALUE_' } }

    it { should contain_file('/etc/basemodule/config.cfg').with_mode('_VALUE_') }
  end

  describe 'on Debian with parameter: config_group' do
    let (:facts) { debian_facts }
    let (:params) { { :config_group => '_VALUE_' } }

    it { should contain_file('/etc/basemodule/config.cfg').with_group('_VALUE_') }
  end

  describe 'on Debian with parameter: config_user' do
    let (:facts) { debian_facts }
    let (:params) { { :config_user => '_VALUE_' } }

    it { should contain_file('/etc/basemodule/config.cfg').with_owner('_VALUE_') }
  end

  #describe 'on Debian with parameter: daemon_group' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :daemon_group => '_VALUE_' } }
  #
  #  it { should contain_file('/etc/default/basemodule').with_content(/_VALUE_/) }
  #end

  #describe 'on Debian with parameter: daemon_user' do
  #  let (:facts) { debian_facts }
  #  let (:params) { { :daemon_user => '_VALUE_' } }
  #
  #  it { should contain_file('/etc/default/basemodule').with_content(/_VALUE_/) }
  #end

  describe 'on Debian with parameter: pkg_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_ensure => '_VALUE_' } }

    it { should contain_package('basemodule').with_ensure('_VALUE_') }
  end

  describe 'on Debian with parameter: pkg_list' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_list => '_VALUE_' } }

    it { should contain_package('_VALUE_') }
  end

  describe 'on Debian with parameter: service_enable' do
    let (:facts) { debian_facts }
    let (:params) { { :service_enable => '_VALUE_' } }

    it { should contain_service('basemodule').with_enable('_VALUE_') }
  end

  describe 'on Debian with parameter: service_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :service_ensure => '_VALUE_' } }

    it { should contain_service('basemodule').with_ensure('_VALUE_') }
  end

  describe 'on Debian with parameter: service_hasstatus' do
    let (:facts) { debian_facts }
    let (:params) { { :service_hasstatus => '_VALUE_' } }

    it { should contain_service('basemodule').with_hasstatus('_VALUE_') }
  end

  describe 'on Debian with parameter: service_name' do
    let (:facts) { debian_facts }
    let (:params) { { :service_name => '_VALUE_' } }

    it { should contain_service('_VALUE_') }
  end
end

