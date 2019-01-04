require 'nullz/version'

def _(obj)
  obj || Nullz::NullObject.new
end

def __(obj, on_null_object_created_proc = Nullz::ON_NULL_OBJECT_CREATED)
  return obj if obj

  on_null_object_created_proc.call

  Nullz::NullObject.new
end

def safe(obj, on_null_object_created_proc = Nullz::ON_NULL_OBJECT_CREATED)
  Nullz::USE_NULL_OBJECT ? __(obj, on_null_object_created_proc) : obj
end

module Nullz
  ON_NULL_OBJECT_CREATED = Proc.new { }
  USE_NULL_OBJECT = false

  class NullObject
    def method_missing(method, *_args, &_block)
      return false if method.to_s.index('?')
      NullObject.new unless method == :to_ary
    end

    def to_s
      ''
    end

    alias_method :to_str, :to_s

    def coerce(value)
      [NullObject.new, value]
    end

    def return_null_object(_value)
      NullObject.new
    end

    alias_method :+, :return_null_object
    alias_method :-, :return_null_object
    alias_method :*, :return_null_object
    alias_method :/, :return_null_object
    alias_method :|, :return_null_object
    alias_method :^, :return_null_object
    alias_method :~, :return_null_object
    alias_method :&, :return_null_object
    alias_method :[], :return_null_object
    alias_method :<<, :return_null_object
    alias_method :>>, :return_null_object

    def ==(value)
      value.nil?
    end

    def !=(value)
      !value.nil?
    end

    def to_int
      0
    end

    def to_bool
      false
    end

    alias_method :to_b, :to_bool

    def >(_value)
      return false
    end

    def <(_value)
      return false
    end

    def empty?
      true
    end

    def nil?
      true
    end

    def null?
      true
    end
  end
end

