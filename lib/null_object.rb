require 'nullz/version'

ON_NULL_OBJECT_CREATED = Proc.new { }
USE_NULL_OBJECT = false

def _(obj)
  obj || NullObject.new
end

def __(obj, on_null_object_created_proc = ON_NULL_OBJECT_CREATED)
  return obj if obj

  on_null_object_created_proc.call

  NullObject.new
end

def safe(obj, on_null_object_created_proc = ON_NULL_OBJECT_CREATED)
  USE_NULL_OBJECT ? __(obj, on_null_object_created_proc) : obj
end

class NullObject
  def method_missing(method, *_args, &_block)
    return false if method.to_s.index('?')
    NullObject.new unless method == :to_ary
  end

  def to_s
    to_str
  end

  def to_str
    ''
  end

  def return_null_object(_value)
    NullObject.new
  end

  def coerce(value)
    [NullObject.new, value]
  end

  def +(_value)
    NullObject.new
  end

  def -(_value)
    NullObject.new
  end

  def *(_value)
    NullObject.new
  end

  def /(_value)
    NullObject.new
  end

  def [](_value)
    NullObject.new
  end

  def <<(_value)
    NullObject.new
  end

  def >>(_value)
    NullObject.new
  end

  def ==(value)
    value.nil?
  end

  def !=(value)
    !value.nil?
  end

  def >(_value)
    false
  end

  def <(_value)
    false
  end

  def |(_value)
    NullObject.new
  end

  def ^(_value)
    NullObject.new
  end

  def ~(_value)
    NullObject.new
  end

  def &(_value)
    NullObject.new
  end

  def to_int
    0
  end

  def to_b
    false
  end

  def to_bool
    false
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


