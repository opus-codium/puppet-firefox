# puppet-firefox

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

