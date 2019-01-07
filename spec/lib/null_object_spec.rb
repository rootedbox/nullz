require "spec_helper"

global_test_variable = 0

RSpec.describe Nullz::NullObject do
  context 'when an operator is used' do
    it 'returns null object with addition' do
      expect(subject + 3).to be_an(Nullz::NullObject)
      expect(3 + subject).to be_an(Nullz::NullObject)
    end

    it 'returns null object with subtraction' do
      expect(subject - 3).to be_an(Nullz::NullObject)
      expect(3 - subject).to be_an(Nullz::NullObject)
    end

    it 'returns null object with division' do
      expect(subject / 3).to be_an(Nullz::NullObject)
      expect(3 / subject).to be_an(Nullz::NullObject)
    end

    it 'returns null object with multiplication' do
      expect(subject * 3).to be_an(Nullz::NullObject)
      expect(3 * subject).to be_an(Nullz::NullObject)
    end

    it 'returns null object with and' do
      expect(subject & 3).to be_an(Nullz::NullObject)
      expect(3 & subject).to be_an(Nullz::NullObject)
    end

    it 'returns null object with xor' do
      expect(subject ^ 3).to be_an(Nullz::NullObject)
      expect(3 ^ subject).to be_an(Nullz::NullObject)
    end

    it 'returns null object with or' do
      expect(subject | 3).to be_an(Nullz::NullObject)
      expect(3 | subject).to be_an(Nullz::NullObject)
    end

    it 'returns a null object with left shift' do
      expect(subject << 3).to be_an(Nullz::NullObject)
    end

    it 'returns a null object with right shift' do
      expect(subject >> 3).to be_an(Nullz::NullObject)
    end

    it 'inserts a null object when shifting into an array' do
      an_array = Array.new
      an_array << 1
      an_array << subject

      expect(an_array).to be_an(Array)
      expect(an_array[1]).to be_an(Nullz::NullObject)
    end

    it 'returns false when == to all not nil or not null objects' do
      expect(subject == 3).to eq(false)
      expect('something' == subject).to eq(false)
      expect('' == subject).to eq(false)
    end

    it 'returns true when == to all nil or null objects' do
      expect(subject == nil).to eq(true)
      expect(Nullz::NullObject.new == subject).to eq(true)
    end

    it 'returns false when != to all nil or null objects' do
      expect(subject != nil).to eq(false)
      expect(Nullz::NullObject.new != subject).to eq(false)
    end

    it 'returns true when != to all not nil or not null objects' do
      expect(subject != 3).to be(true)
      expect('something' != subject).to eq(true)
      expect('' != subject).to eq(true)
    end

    it 'returns false when < to all not nil or not null objects' do
      expect(subject < 3).to eq(false)
      expect(3 < subject).to eq(false)
    end

    it 'returns false when < to all nil or null objects' do
      expect(subject < nil).to eq(false)
      expect(Nullz::NullObject.new < subject).to eq(false)
    end

    it 'returns false when > to all not nil or not null objects' do
      expect(subject > 3).to eq(false)
      expect(3 > subject).to eq(false)
    end

    it 'returns false when < to all nil or null objects' do
      expect(subject > nil).to eq(false)
      expect(Nullz::NullObject.new > subject).to eq(false)
    end

    it 'returns a null object with something more complicated' do
      expect(((subject + 3 / (2 ^ 8) * subject).index(3) << 2)[234]).to be_an(Nullz::NullObject)
    end
  end

  context 'to_functions' do
    it 'returns to_r returns the same value as nil.to_r' do
      expect(subject.to_r).to eq(nil.to_r)
    end

    it 'returns to_f returns the same value as nil.to_f' do
      expect(subject.to_f).to eq(nil.to_f)
    end

    it 'returns to_i returns the same value as nil.to_i' do
      expect(subject.to_i).to eq(nil.to_i)
    end

    it 'returns to_s returns the same value as nil.to_s' do
      expect(subject.to_s).to eq(nil.to_s)
    end

    it 'returns to_c returns the same value as nil.to_c' do
      expect(subject.to_c).to eq(nil.to_c)
    end

    it 'returns to_b returns false' do
      expect(subject.to_b).to eq(false)
    end
  end

  context 'mock nil functions' do
    it 'mocks inspect' do
      expect(subject.inspect).to eq(nil.inspect)
    end

    it 'mocks rationalize' do
      expect(subject.rationalize).to eq(nil.rationalize)
    end
  end

  context 'question functions' do
    it 'returns true nil?' do
      expect(subject.nil?).to eq(true)
    end

    it 'returns true null?' do
      expect(subject.null?).to eq(true)
    end

    it 'returns true empty?' do
      expect(subject.empty?).to eq(true)
    end

    it 'returns false on all other questions' do
      expect(subject.assigned?).to eq(false)
      expect(subject.a_question?).to eq(false)
      expect(subject.something?).to eq(false)
      expect(subject.whatever?).to eq(false)
    end
  end


  context '_' do
    it 'returns a NullObject when an item is nil' do
      result = _(nil)
      expect(result).to be_an(Nullz::NullObject)
    end

    it 'returns a the item when an item is not nil' do
      item = 3
      result = _(item)
      expect(result).to be(item)
    end
  end

  context '__' do
    it 'does not perform a proc ON_NULL_OBJECT_CREATED is set to default' do
      expect(global_test_variable).to eq(0)

      __(nil)

      expect(global_test_variable).to eq(0)
    end

    it 'does perform a proc Nullz.on_null_object_created when it is set' do
      expect(global_test_variable).to eq(0)

      Nullz.on_null_object_created = Proc.new { global_test_variable = 10 }

      __(nil)

      expect(global_test_variable).to eq(10)
    end
  end

  context 'safe' do
    it 'uses null objects when Nullz.use_null_object is set to true' do
      Nullz.use_null_object = true
      result = safe(nil)

      expect(result).to be_an(Nullz::NullObject)
    end

    it 'does not use null objects when Nullz.use_null_object is set to false' do
      Nullz.use_null_object = false
      result = safe(nil)

      expect(result).not_to be_an(Nullz::NullObject)
    end

    it 'does not use null objects by default' do
      result = safe(nil)

      expect(result).not_to be_an(Nullz::NullObject)
    end
  end
end

