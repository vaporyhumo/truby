# typed: false
# frozen_string_literal: true

describe Truby::Parser do
  describe '.call' do
    let(:actual) { described_class.call(input) }

    context 'when given "false"' do
      specify do
        require_relative '../examples/false'
        Truby::Integrations::False.tap do |integration|
          expect(integration.lex).to eq(integration.tokens)
          expect(integration.parse).to eq(integration.node)
        end
      end
    end

    xcontext 'when given "nil"' do
      specify { expect(described_class.('nil')).to   eq(Truby::Node::Nil::new [Truby::Token::new(:nil, 'nil')]) }
    end

    xcontext 'when given "true"' do
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
