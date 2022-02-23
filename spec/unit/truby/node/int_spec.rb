# typed: false
# frozen_string_literal: true

describe Truby::Node::Int do
  describe '#transpile' do
    specify { expect(s(:int, '1').transpile).to eq '1' }
  end

  describe '#to_s' do
    specify { expect(s(:int, '1').to_s).to eq '(int 1)' }
  end
end
