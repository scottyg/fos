# DEPRECATED

[![Gem Version](https://badge.fury.io/rb/fos.svg)](http://badge.fury.io/rb/fos) [![Build Status](https://travis-ci.org/scottyg/fos.svg?branch=master)](https://travis-ci.org/scottyg/fos)

Fos is a folder archive tool for Linux or Mac. By default Fos archives ~/Desktop and ~/Downloads, but can easily archive any folder.

## Installation

Fos is a Ruby Gem and can be easily installed with the command `gem install fos`.

If you do not yet have [ruby installed](https://www.ruby-lang.org/en/installation/) you will need to do that first.

## Usage

Basic usage is `fos` and archives ~/Desktop and ~/Downloads.

`fos -h` shows you options.

```
Options
    -p, --path PATH
    -n, --name NAME
    -z, --zip
    -h, --help
    -v, --version
```

###Examples:

`fos -p /path/to/folder`

Archives the contents of /path/to/folder into /path/to/folder/archive

`fos -n new_name`

Archives the contents of ~/Desktop and ~/Downloads into ~/Desktop/new_name and ~/Downloads/new_name respectively.

`fos -z`

Archives and zips the contents of ~/Desktop and ~/Downloads into ~/Desktop/archive.zip and ~/Downloads/archive.zip respectively.

`fos -p /path/to/folder -n new_name -z`

Archives and zips the contents of /path/to/folder into /path/to/folder/new_name.zip.

###Config

Config file located at ~/.fos/config.yml

## Development

First time installing for dev on your system run `bundle install`

Then run `rake install` to build Fos from source
