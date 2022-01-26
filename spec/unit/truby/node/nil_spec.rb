# typed: false
# frozen_string_literal: true

describe Truby::Node::Nil do
  describe '#initialize' do
    specify { expect(described_class::new([t(:id, 'foo')]).tokens).to eq([t(:id, 'foo')]) }
  end

  describe '#inspect' do
    specify { expect(described_class::new([]).inspect).to eq '(nil)' }
  end
end
