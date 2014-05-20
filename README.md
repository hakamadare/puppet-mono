# Mono Puppet Module for Boxen [![Build Status](https://travis-ci.org/hakamadare/puppet-mono.png)](https://travis-ci.org/hakamadare/puppet-mono)

Install [Mono](http://mono-project.com/), an open source, cross-platform,
implementation of C# and the CLR that is binary compatible with Microsoft.NET

## Usage

```puppet
class { 'mono':
  development => true,
}
```

## Required Puppet Modules

* `boxen`
* `homebrew`
* `stdlib`
* `runthebusiness/fetchfile`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
