# frozen_string_literal: true

describe Truby do
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
