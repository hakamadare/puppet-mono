require 'spec_helper'

describe 'mono' do
  let (:params) {{:version => '3.4.0'}}

  describe 'default' do
    it do
      should contain_package('MonoFramework-MRE-3.4.0.macos10.xamarin.x86').with({
        :provider => 'apple',
        :source   => '/opt/boxen/cache/MonoFramework-MRE-3.4.0.macos10.xamarin.x86.pkg',
      })
    end
  end

  describe 'MRE' do
    let (:params) {{:development => false}}
    it do
      should contain_package('MonoFramework-MRE-3.4.0.macos10.xamarin.x86').with({
        :provider => 'apple',
        :source   => '/opt/boxen/cache/MonoFramework-MRE-3.4.0.macos10.xamarin.x86.pkg',
      })
    end
  end

  describe 'MDK' do
    let (:params) {{:development => true}}
    it do
      should contain_package('MonoFramework-MDK-3.4.0.macos10.xamarin.x86').with({
        :provider => 'apple',
        :source   => '/opt/boxen/cache/MonoFramework-MDK-3.4.0.macos10.xamarin.x86.pkg',
      })
    end
  end
end
