# typed: false
# frozen_string_literal: true

describe Truby::Parser do
  describe '.parse_step' do
    specify {
      node = Truby::Node::Empty.new
      token = Truby::Token::new(:id, 'foo')
      allow(node).to receive(:add).and_call_original
      Truby::Parser.parse_step(node, token)
      expect(node).to have_received(:add).with(token)
    }
  end

  describe '.call' do
    let(:actual) { described_class.call(input) }

    context 'when given "false"' do
      specify { expect(described_class.('false')).to   eq(Truby::Node::False::new [Truby::Token::new(:false, 'false')]) }
    end

    context 'when given "nil"' do
      specify { expect(described_class.('nil')).to   eq(Truby::Node::Nil::new [Truby::Token::new(:nil, 'nil')]) }
    end

    context 'when given "true"' do
      specify { expect(described_class.('true')).to  eq(Truby::Node::True::new [Truby::Token::new(:true, 'true')]) }
    end

    xcontext 'when given "1"' do
      specify { expect(described_class.('1')).to     eq(Truby::Node::int('1')) }
    end

    xcontext 'when given "-1"' do
      specify { expect(described_class.('-1')).to    eq(Truby::Node::int('-1')) }
    end

    xcontext 'when given "foo=true"' do
      let(:input) { 'foo=true' }

      specify { expect(actual).to eq(Truby::Node::lvar_assign('foo', Truby::Node::True::new([Truby::Token::new(:true, 'true')]), [])) }
    end

    xcontext 'when given "Boolean foo=true"' do
      let(:input) { 'Boolean foo=true' }
      let(:expected) { Truby::Node::lvar_assign('foo', Truby::Node::true, []) }

      specify { expect(actual).to eq expected }
    end
  end
end
