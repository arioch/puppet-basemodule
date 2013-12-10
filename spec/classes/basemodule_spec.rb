require 'spec_helper'

describe 'basemodule', :type => :class do
  let (:pre_condition) { '$concat_basedir = "/tmp"' }
  let (:facts) { debian_facts }
  let (:params) {
    {
      :config_dir => '/etc/basemodule',
      :config_file => '/etc/basemodule/config.cfg'
    }
  }

  describe 'without parameters' do
    it { should create_class('basemodule') }
    it { should contain_class('basemodule::install') }
    it { should contain_class('basemodule::config') }
    it { should contain_class('basemodule::service') }

    it { should contain_package('basemodule').with_ensure('present') }
    it { should contain_file('/etc/basemodule').with_ensure('directory') }

    it { should contain_service('basemodule').with(
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasrestart' => 'true'
      )
    }
  end

  describe 'with parameter: config_file' do
    let (:params) { { :config_file => '/etc/basemodule/config.cfg' } }

    it { should contain_file('/etc/basemodule/config.cfg').with(
        'ensure'  => 'present',
        'content' => /Managed by Puppet/
      )
    }
  end

  describe 'with parameter: config_file_mode' do
    let (:params) { { :config_file_mode => '_VALUE_' } }

    it {
      should contain_file('/etc/basemodule/config.cfg').with(
        'mode' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_group' do
    let (:params) { { :config_group => '_VALUE_' } }

    it {
      should contain_file('/etc/basemodule/config.cfg').with(
        'group' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_user' do
    let (:params) { { :config_user => '_VALUE_' } }

    it {
      should contain_file('/etc/basemodule/config.cfg').with(
        'owner' => '_VALUE_'
      )
    }
  end

  #describe 'with parameter: daemon_group' do
  #  let (:params) { { :daemon_group => '_VALUE_' } }
  #
  #  it {
  #    should contain_file('/etc/default/basemodule').with(
  #      'content' => /_VALUE_/
  #    )
  #  }
  #end

  #describe 'with parameter: daemon_user' do
  #  let (:params) { { :daemon_user => '_VALUE_' } }
  #
  #  it {
  #    should contain_file('/etc/default/basemodule').with(
  #      'content' => /_VALUE_/
  #    )
  #  }
  #end

  describe 'with parameter: pkg_ensure' do
    let (:params) { { :pkg_ensure => '_VALUE_' } }

    it {
      should contain_package('basemodule').with(
        'ensure' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: pkg_list' do
    let (:params) { { :pkg_list => '_VALUE_' } }

    it {
      should contain_package('_VALUE_')
    }
  end

  describe 'with parameter: service_enable' do
    let (:params) { { :service_enable => '_VALUE_' } }

    it {
      should contain_service('basemodule').with(
        'enable' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: service_ensure' do
    let (:params) { { :service_ensure => '_VALUE_' } }

    it {
      should contain_service('basemodule').with(
        'ensure' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: service_hasstatus' do
    let (:params) { { :service_hasstatus => '_VALUE_' } }

    it {
      should contain_service('basemodule').with(
        'hasstatus' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: service_name' do
    let (:params) { { :service_name => '_VALUE_' } }

    it {
      should contain_service('_VALUE_')
    }
  end
end

