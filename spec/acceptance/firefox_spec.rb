require 'spec_helper_acceptance'

describe 'firefox class' do
  it 'works idempotently with no errors' do
    pp = <<~MANIFEST
      class { 'firefox':
      }
    MANIFEST

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
  end
end
