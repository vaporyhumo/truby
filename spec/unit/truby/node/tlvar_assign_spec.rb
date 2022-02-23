# typed: false
# frozen_string_literal: true

describe Truby::Node::TlvarAssign do
  describe '#transpile' do
    let(:const) { s :const, nil, 'Const', [] }
    let(:node) { s :tlvar_assign, const, 'foo', nil, [] }

    specify { expect { node.transpile }.to raise_error RuntimeError }
  end
end
