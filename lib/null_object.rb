require 'null_object/version'


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

  def return_null_object(value)
    NullObject.new
  end

  def coerce(value)
    [NullObject.new, value]
  end

  def +(value)
    NullObject.new
  end

  def -(value)
    NullObject.new
  end

  def *(value)
    NullObject.new
  end

  def /(value)
    NullObject.new
  end

  def [](value)
    NullObject.new
  end

  def <<(value)
    NullObject.new
  end

  def >>(value)
    NullObject.new
  end

  def ==(value)
    value.nil?
  end

  def !=(value)
    !value.nil?
  end

  def >(value)
    false
  end

  def <(value)
    false
  end

  def |(value)
    NullObject.new
  end

  def ^(value)
    NullObject.new
  end

  def ~(value)
    NullObject.new
  end

  def &(value)
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

