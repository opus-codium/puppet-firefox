require 'spec_helper'

describe 'firefox' do
  let(:facts) do
    {
      osfamily: 'FreeBSD',
      operatingsystem: 'FreeBSD',
    }
  end

  it { is_expected.to compile.with_all_deps }

  it { is_expected.to contain_package('firefox') }
end 
