# frozen_string_literal: true

require 'spec_helper'

describe 'firefox::pref' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      let(:title) { 'an.option.name' }

      let(:params) do
        {
          value: pref_value,
          locked: pref_locked,
        }
      end

      let(:pref_value) { 'value' }
      let(:pref_locked) { :undef }

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

      context 'locked preferences' do
        let(:pref_locked) { true }

        it { is_expected.to contain_concat__fragment('an.option.name').with(content: %(lockPref("an.option.name", "value");\n)) }
      end
    end
  end
end
