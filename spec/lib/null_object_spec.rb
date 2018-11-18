require "spec_helper"

RSpec.describe NullObject do
  context 'when an operator is used' do
    it 'returns null object with addition' do
      expect(subject + 3).to be_an(NullObject)
      expect(3 + subject).to be_an(NullObject)
    end

    it 'returns null object with subtraction' do
      expect(subject - 3).to be_an(NullObject)
      expect(3 - subject).to be_an(NullObject)
    end

    it 'returns null object with division' do
      expect(subject / 3).to be_an(NullObject)
      expect(3 / subject).to be_an(NullObject)
    end

    it 'returns null object with multiplication' do
      expect(subject * 3).to be_an(NullObject)
      expect(3 * subject).to be_an(NullObject)
    end

    it 'returns null object with and' do
      expect(subject & 3).to be_an(NullObject)
      expect(3 & subject).to be_an(NullObject)
    end

    it 'returns null object with xor' do
      expect(subject ^ 3).to be_an(NullObject)
      expect(3 ^ subject).to be_an(NullObject)
    end

    it 'returns null object with or' do
      expect(subject | 3).to be_an(NullObject)
      expect(3 | subject).to be_an(NullObject)
    end

    it 'returns a null object with left shift' do
      expect(subject << 3).to be_an(NullObject)
    end

    it 'returns a null object with right shift' do
      expect(subject >> 3).to be_an(NullObject)
    end

    it 'inserts a null object when shifting into an array' do
      an_array = Array.new
      an_array << 1
      an_array << subject

      expect(an_array).to be_an(Array)
      expect(an_array[1]).to be_an(NullObject)
    end

    it 'returns false when == to all not nil or not null objects' do
      expect(subject == 3).to eq(false)
      expect('something' == subject).to eq(false)
      expect('' == subject).to eq(false)
    end

    it 'returns true when == to all nil or null objects' do
      expect(subject == nil).to eq(true)
      expect(NullObject.new == subject).to eq(true)
    end

    it 'returns false when != to all nil or null objects' do
      expect(subject != nil).to eq(false)
      expect(NullObject.new != subject).to eq(false)
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
      expect(NullObject.new < subject).to eq(false)
    end

    it 'returns false when > to all not nil or not null objects' do
      expect(subject > 3).to eq(false)
      expect(3 > subject).to eq(false)
    end

    it 'returns false when < to all nil or null objects' do
      expect(subject > nil).to eq(false)
      expect(NullObject.new > subject).to eq(false)
    end
  end

  it 'returns false on any question not concerning assignment' do
    expect(subject.a_question?).to eq(false)
    expect(subject.something?).to eq(false)
    expect(subject.whatever?).to eq(false)
  end

  it 'returns a null object with something more complicated' do
    expect(((subject + 3 / (2 ^ 8) * subject).index(3) << 2)[234]).to be_an(NullObject)
  end
end
