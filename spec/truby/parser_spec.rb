# frozen_string_literal: true

describe Truby::Parser do
  describe '.call' do
    context 'when given "false"' do
      specify { expect(described_class.('false')).to match(Truby::Node::false) }
    end

    context 'when given "nil"' do
      specify { expect(described_class.('nil')).to   match(Truby::Node::nil) }
    end

    context 'when given "true"' do
      specify { expect(described_class.('true')).to  match(Truby::Node::true) }
    end

    context 'when given "1"' do
      specify { expect(described_class.('1')).to     match(Truby::Node::int('1')) }
    end

    context 'when given "-1"' do
      specify { expect(described_class.('-1')).to    match(Truby::Node::int('-1')) }
    end

    context 'when given "foo=true"' do
      specify { expect(described_class.('foo=true')).to match(Truby::Node::assign('foo', Truby::Node::true)) }
    end
  end
end
