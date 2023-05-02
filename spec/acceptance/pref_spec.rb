# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'firefox::pref class' do
  it 'works idempotently with no errors' do
    pp = <<~MANIFEST
      firefox::pref { 'browser.urlbar.trimURLs':
        value => false,
      }
    MANIFEST

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
  end
end
