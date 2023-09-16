# puppet-firefox

<!-- header GFM -->
[![Build Status](https://img.shields.io/github/actions/workflow/status/opus-codium/puppet-firefox/release.yml)](https://github.com/opus-codium/puppet-firefox/releases)
[![Puppet Forge](https://img.shields.io/puppetforge/v/opuscodium/firefox.svg)](https://forge.puppetlabs.com/opuscodium/firefox)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/opuscodium/firefox.svg)](https://forge.puppetlabs.com/opuscodium/firefox)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/opuscodium/firefox.svg)](https://forge.puppetlabs.com/opuscodium/firefox)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/opuscodium/firefox.svg)](https://forge.puppetlabs.com/opuscodium/firefox)
[![License](https://img.shields.io/github/license/opus-codium/puppet-firefox.svg)](https://github.com/voxpupuli/opuscodium-firefox/blob/master/LICENSE.md)
<!-- header -->

#### Table of Contents

<!-- vim-markdown-toc GFM -->

* [Module description](#module-description)
* [Usage](#usage)
    * [Setting custom default-values](#setting-custom-default-values)

<!-- vim-markdown-toc -->

## Module description

This Puppet module allows Puppet to set default Firefox preferences for your managed nodes.

## Usage

### Setting custom default-values

```puppet
firefox::pref { 'browser.urlbar.trimURLs': value => false }
firefox::pref { 'browser.urlbar.formatting.enabled': value => false }
```

