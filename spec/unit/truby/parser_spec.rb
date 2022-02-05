# typed: false
# frozen_string_literal: true

describe Truby::Parser do
  describe '.parse_step' do
    specify {
      node = Truby::Node::Empty.new
      token = t :id, 'foo'
      allow(node).to receive(:add).and_call_original
      Truby::Parser.parse_step(node, token)
      expect(node).to have_received(:add).with(token)
    }
  end

  describe '.call' do
    let(:actual) { described_class.call(input) }

    context 'when given "nil"' do
      specify { expect(described_class.('nil')).to eq(Truby::Node::Nil::new [t(:nil, 'nil')]) }
    end
  end
end
