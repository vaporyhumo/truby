# typed: false
# frozen_string_literal: true

describe Truby::Node::True do
  describe '#initialize' do
    specify { expect(described_class::new(tokens: [t(:id, 'foo')]).tokens).to eq([t(:id, 'foo')]) }
  end

  describe '#to_s' do
    specify { expect(described_class::new(tokens: []).to_s).to eq '(true)' }
  end

  describe '#transpile' do
    specify { expect(described_class::new(tokens: []).transpile).to eq 'true' }
  end
end
