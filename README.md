[![Build Status](https://travis-ci.org/vladra/normalize_numbers.svg?branch=master)](https://travis-ci.org/vladra/normalize_numbers)

# NormalizeNumbers

Simple solution for Rails to allow numbers with decimal point to be assigned both with `,` (comma) and `.` (dot), without loosing decimal part.

```ruby
'10,5'.to_f
# 10.0
```

## Installation

Gemfile:
```ruby
gem 'normalize_numbers', git: 'git@github.com:vladra/normalize_numbers.git'
```

## Usage

```ruby
class Model < ActiveRecord::Base
  normalize_numbers :price, :tax
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

