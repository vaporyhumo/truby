# typed: false
# frozen_string_literal: true

describe Truby::Node::TSend do
  describe '#transpile' do
    let(:const) { s(:const, nil, 'Const') }
    let(:node) { described_class::new type: const, message: 'print', tokens: [] }

    specify { expect { node.transpile }.to raise_error RuntimeError }
  end
end
