# frozen_string_literal: true

describe Truby do
  describe '.transpile' do
    specify { expect(described_class.transpile('nil')).to eq('nil') }
    specify { expect(described_class.transpile('true')).to eq('true') }
    specify { expect(described_class.transpile('false')).to eq('false') }
  end

  describe '.lex' do
    specify { expect(described_class.lex('nil')).to eq([[:nil]]) }
    specify { expect(described_class.lex('true')).to eq([[:true]]) }
    specify { expect(described_class.lex('false')).to eq([[:false]]) }
  end
end
