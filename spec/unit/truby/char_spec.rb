# typed: false
# frozen_string_literal: true

describe Truby::Char do
  describe '#initialize' do
    specify { expect { Truby::Char.new(char: 'a') }.not_to raise_error }
    specify { expect { Truby::Char.new(char: 'aa') }.to raise_error ArgumentError }
  end
end
