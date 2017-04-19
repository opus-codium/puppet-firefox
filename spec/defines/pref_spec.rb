require 'spec_helper'

describe 'firefox::pref' do
  let(:title) { 'an.option.name' }

  let(:params) do
    {
      value: pref_value,
    }
  end
  let(:facts) do
    {
      osfamily: 'FreeBSD',
    }
  end

  context 'with a boolean value' do
    let(:pref_value) do
      true
    end

    it { is_expected.to contain_concat__fragment('an.option.name').with(content: %(pref("an.option.name", true);\n)) }
  end

  context 'with a number value' do
    let(:pref_value) do
      42
    end

    it { is_expected.to contain_concat__fragment('an.option.name').with(content: %(pref("an.option.name", 42);\n)) }
  end

  context 'with a string value' do
    context 'without quotes' do
      let(:pref_value) do
        'a value'
      end

      it { is_expected.to contain_concat__fragment('an.option.name').with(content: %(pref("an.option.name", "a value");\n)) }
    end

    context 'with quotes' do
      let(:pref_value) do
        %(a 'value' with "quotes")
      end

      it { is_expected.to contain_concat__fragment('an.option.name').with(content: %(pref("an.option.name", "a 'value' with \\"quotes\\"");\n)) }
    end
  end
end
