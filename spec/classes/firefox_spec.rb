# frozen_string_literal: true

require 'spec_helper'

describe 'firefox' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { is_expected.to compile.with_all_deps }

      if %w[debian-10-x86_64 debian-11-x86_64 debian-12-x86_64 debian-13-x86_64].include?(os)
        it { is_expected.to contain_package('firefox-esr') }
      else
        it { is_expected.to contain_package('firefox') }
      end
    end
  end
end
