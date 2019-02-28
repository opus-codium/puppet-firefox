# puppet-firefox

[![Build Status](https://travis-ci.com/opus-codium/puppet-firefox.svg?branch=master)](https://travis-ci.com/opus-codium/puppet-firefox)

1. [Module Description - What the module does and why it is useful](#module-description)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Public Classes](#public-classes)
    * [Defined Types](#defined-types)

## Module description

This Puppet module allows Puppet to set default Firefox preferences for your managed nodes.

## Usage

### Setting custom default-values

```puppet
firefox::pref { 'browser.urlbar.trimURLs': value => false }
firefox::pref { 'browser.urlbar.formatting.enabled': value => false }
```

## Reference

* [Public classes](#public-classes)
    * [`firefox`](#class-firefox)
* [Defined Types](#defined-types)
    * [`firefox::pref`](#defined-type-firefoxpref)

### Public Classes

#### Class: `firefox`

##### `config`

Path to the configuration file to manage.

Default: system-dependant

##### `owner`

Owner of the configuration file.

Default: 'root'

##### `group`


Group of the configuration file.

Default: 'root'

### Defined Types

#### Defined type: `firefox::pref`

##### `value`

Setting value.

Default: undef

##### `locked`

If set to true, the user is not allowed to change this setting.

Default: 'false'
