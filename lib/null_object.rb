require 'nullz/version'

def _(obj)
  obj || Nullz::NullObject.new
end

def __(obj, on_null_object_created_proc = Proc.new { })
  return obj if obj

  (Nullz.on_null_object_created || on_null_object_created_proc).call

  Nullz::NullObject.new
end

def safe(obj, on_null_object_created_proc = Proc.new { })
  Nullz.use_null_object ? __(obj, on_null_object_created_proc) : obj
end

module Nullz
  attr_accessor :on_null_object_created, :use_null_object

  module_function :on_null_object_created
  module_function :use_null_object
  module_function :on_null_object_created=
  module_function :use_null_object=

  class NullObject
    def inspect
      nil.inspect
    end

    def rationalize
      nil.rationalize
    end

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

    def to_r
      nil.to_r
    end

    def to_f
      nil.to_f
    end

    def to_i
      nil.to_i
    end

    def to_s
      nil.to_s
    end

    def to_c
      nil.to_c
    end

    def to_b
      false
    end

    alias_method :to_str, :to_s
    alias_method :to_bool, :to_b

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

    def method_missing(method, *_args, &_block)
      return false if method.to_s.index('?')
      NullObject.new unless method == :to_ary
    end
  end
end

