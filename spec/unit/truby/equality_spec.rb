# typed: false
# frozen_string_literal: true

describe Truby::Equality do
  describe '#define_equality' do
    let(:klass) {
      Class.new do
        extend Truby::Equality

        define_equality :x, :y

        def initialize(x, y)
          @x, @y = x, y
        end

        attr_reader :x, :y
      end
    }

    specify { expect(klass.new(1, 2)).to eq klass.new(1, 2) }
    specify { expect(klass.new(1, 2)).not_to eq klass.new(2, 2) }
    specify { expect(klass.new(1, 2)).to be_eql klass.new(1, 2) }
    specify { expect(klass.new(1, 2)).not_to be_eql klass.new(2, 2) }
  end
end
