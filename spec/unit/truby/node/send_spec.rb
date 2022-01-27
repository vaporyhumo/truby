# typed: false
# frozen_string_literal: true

describe Truby::Node::Send do
  describe '#initialize' do
    specify {
      tokens = []
      message = 'foo'
      receiver = Truby::Node::Empty::new
      node = Truby::Node::Send.new receiver: receiver, message: message, tokens: tokens
      expect(node.tokens).to eq(tokens)
      expect(node.message).to eq(message)
      expect(node.receiver).to eq(receiver)
    }
  end

  describe '#add' do
    specify {
      node = Truby::Node::Send.new receiver: Truby::Node::Empty::new, message: 'foo', tokens: [t(:id, 'foo')]
      token = Truby::Token.new(:assign, '=')
      new_node = Truby::Node::LvarAssign.new('foo', nil, [t(:id, 'foo'), token])
      expect(node.add(token)).to eq new_node
    }
  end

  describe '#inspect' do
    specify { expect(described_class::new(receiver: nil, message: 'bar', tokens: []).inspect).to eq('(send nil bar)') }
  end
end
