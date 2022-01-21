# frozen_string_literal: true

describe Truby do
  describe '.parse' do
    let(:s) { -> type { described_class::Node.new(type)} }

    specify { expect(described_class.parse('false')).to match(Truby::Node::False::new) }
    specify { expect(described_class.parse('nil')).to   match(Truby::Node::Nil::new) }
    specify { expect(described_class.parse('true')).to  match(Truby::Node::True::new) }
    specify { expect(described_class.parse('1')).to  match(Truby::Node::Int::new('1')) }
    specify { expect(described_class.parse('-1')).to  match(Truby::Node::Int::new('-1')) }
  end

  describe '.rewrite' do
    specify { expect(described_class.rewrite('false')).to eq('false') }
    specify { expect(described_class.rewrite('nil')).to eq('nil') }
    specify { expect(described_class.rewrite('true')).to eq('true') }
    specify { expect(described_class.rewrite('1')).to eq('1') }
    specify { expect(described_class.rewrite('-1')).to eq('-1') }
  end

  describe '.transpile' do
    specify { expect(described_class.transpile('nil')).to eq('nil') }
    specify { expect(described_class.transpile('true')).to eq('true') }
    specify { expect(described_class.transpile('false')).to eq('false') }
    specify { expect(described_class.transpile('1')).to eq('1') }
    specify { expect(described_class.transpile('-1')).to eq('-1') }
  end
end
