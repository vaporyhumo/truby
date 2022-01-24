# typed: false
# frozen_string_literal: true

describe Truby::Parser do
  describe '.call' do
    let(:actual) { described_class.call(input) }

    context 'when given "false"' do
      specify { expect(described_class.('false')).to eq(Truby::Node::false) }
    end

    context 'when given "nil"' do
      specify { expect(described_class.('nil')).to   eq(Truby::Node::nil) }
    end

    context 'when given "true"' do
      specify { expect(described_class.('true')).to  eq(Truby::Node::true) }
    end

    context 'when given "1"' do
      specify { expect(described_class.('1')).to     eq(Truby::Node::int('1')) }
    end

    context 'when given "-1"' do
      specify { expect(described_class.('-1')).to    eq(Truby::Node::int('-1')) }
    end

    context 'when given "foo=true"' do
      let(:input) { 'foo=true' }
      specify { expect(actual).to eq(Truby::Node::lvar_assign('foo', Truby::Node::true, [])) }
    end

    context 'when given "Boolean foo=true"' do
      let(:input) { 'Boolean foo=true' }
      let(:expected) { Truby::Node::lvar_assign('foo', Truby::Node::true, []) }

      specify { expect(actual).to eq expected }
    end
  end
end
