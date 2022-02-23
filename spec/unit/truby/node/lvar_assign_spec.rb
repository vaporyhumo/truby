# typed: false
# frozen_string_literal: true

describe Truby::Node::LvarAssign do
  describe '#add' do
    context 'when token type is true' do
      specify {
        true_token = t(:true, 'true')
        node = s(:true, [true_token])
        foo_token = t(:id, 'foo')
        actual = s(:lvar_assign, 'foo', nil, [foo_token]).add(true_token)
        expected = s(:lvar_assign, 'foo', node, [foo_token, true_token])
        expect(actual).to eq(expected)
        expect(actual.value).to eq(node)
      }
    end
  end

  describe '#to_s' do
    specify {
      actual = s(:lvar_assign, 'foo', nil, [t(:id, 'foo')]).to_s
      expect(actual).to eq('(lvarasgn foo nil [[id foo]])')
    }
  end

  describe '#transpile' do
    let(:node) { s :lvar_assign, 'foo', nil, [] }

    specify { expect { node.transpile }.to raise_error RuntimeError }
  end
end

