# typed: false
# frozen_string_literal: true

describe Truby::Node::LvarAssign do
  describe '#add' do
    context 'when token type is true' do
      specify {
        true_token = t(:true, 'true')
        node = Truby::Node::True::new([true_token])
        foo_token = t(:id, 'foo')
        actual = Truby::Node::LvarAssign::new('foo', nil, [foo_token]).add(true_token)
        expected = Truby::Node::LvarAssign::new('foo', node, [foo_token, true_token])
        expect(actual).to eq(expected)
        expect(actual.value).to eq(node)
      }
    end
  end

  describe '#to_s' do
    specify {
      actual = Truby::Node::LvarAssign::new('foo', nil, [t(:id, 'foo')]).to_s
      expect(actual).to eq('(lvarasgn foo nil)')
    }
  end
end
