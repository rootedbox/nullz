# Nullz :crystal_ball:
[![Build Status](https://travis-ci.org/rootedbox/nullz.svg?branch=master)](https://travis-ci.org/rootedbox/nullz)
[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/rootedbox/nullz)
[![Gem Version](https://badge.fury.io/rb/nullz.svg)](https://badge.fury.io/rb/nullz)


A Ruby gem for elegantly handling `nil` values using the Null Object pattern.

## Introduction :book:

`Nullz` provides a robust way to deal with `nil` values in Ruby. Instead of scattering `nil` checks throughout your code, `Nullz` allows you to handle these cases more gracefully with the `NullObject` pattern. This makes your code cleaner, more readable, and less prone to errors.

## Installation :wrench:

Add this line to your application's Gemfile:

```ruby
gem 'nullz'
```

And then execute:
```
bundle install
```

Or install it yourself as:
```
gem install nullz
```

## Usage :bulb:

### Methods

- `_(obj)`: Returns `obj` unless it's `nil`, in which case it returns a `Nullz::NullObject`.

- `__(obj, on_null_object_created_proc = Proc.new {})`: Similar to `_`, but also allows for a custom procedure when a `NullObject` is created.

- `safe(obj, on_null_object_created_proc = Proc.new {})`: Toggles the use of `NullObject` based on the `Nullz.use_null_object` configuration.

### Configuration

Configure `Nullz` in an initializer or similar:

```ruby
Nullz.use_null_object = true
Nullz.on_null_object_created = -> { puts "Null object created!" }
```

### `NullObject` Class

- Represents `nil` or `null`.
- This class defines a special kind of object meant to represent `nil` or `null`.
- It overrides various methods to return either `nil` representations (like in `to_s`, `to_i`, etc.), or a new instance of `NullObject` (in arithmetic and bitwise operations).
- It also defines behavior for comparison (`==`, `!=`) with `nil` and handling of unknown methods via `method_missing`.
- Special methods like `nil?`, `null?`, `empty?` are overridden to provide appropriate behavior for a `null` object.

