# frozen_string_literal: true

describe Truby::Singleton do
  describe 'SINGLETONS' do
    specify { expect(Truby::Singleton::SINGLETONS).to eq %w[false nil true] }
  end

  describe '.===' do
    context 'when given "nil"' do
      specify { expect(described_class === 'nil').to be true }
    end

    context 'when given "true"' do
      specify { expect(described_class === 'true').to be true }
    end

    context 'when given "false"' do
      specify { expect(described_class === 'false').to be true }
    end

    context 'when given "foo"' do
      specify { expect(described_class === 'foo').to be false }
    end
  end
end
