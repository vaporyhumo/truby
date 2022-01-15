# frozen_string_literal: true

describe Truby do
  describe '.lex' do
    let(:t) { ->(type, value = nil) { described_class::Token.new(type, value) } }
    let(:tl) { ->(tokens) { described_class::TokenList.new(tokens) } }

    specify { expect(described_class.lex('nil')).to match(tl.([t.(:nil)])) }
    specify { expect(described_class.lex('true')).to match(tl.([t.(:true)])) }
    specify { expect(described_class.lex('false')).to match(tl.([t.(:false)])) }
  end

  describe '.transpile' do
    specify { expect(described_class.transpile('nil')).to eq('nil') }
    specify { expect(described_class.transpile('true')).to eq('true') }
    specify { expect(described_class.transpile('false')).to eq('false') }
  end
end
