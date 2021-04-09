require 'spec_helper'

describe 'firefox' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { is_expected.to compile.with_all_deps }

      if os == 'debian-10-x86_64'
        it { is_expected.to contain_package('firefox-esr') }
      else
        it { is_expected.to contain_package('firefox') }
      end
    end
  end
end
