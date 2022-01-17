# frozen_string_literal: true

describe Truby::TokenFactory do
  describe '.for' do
    context 'when given "nil"' do
      specify { expect(described_class.for('nil')).to eq(Truby::Token.new(:nil, 'nil')) }
    end

    context 'when given "true"' do
      specify { expect(described_class.for('true')).to eq(Truby::Token.new(:true, 'true')) }
    end

    context 'when given "false"' do
      specify { expect(described_class.for('false')).to eq(Truby::Token.new(:false, 'false')) }
    end
  end

  describe '.false' do
    specify { expect(described_class.false).to eq(Truby::Token.new(:false, 'false')) }
  end

  describe '.nil' do
    specify { expect(described_class.nil).to eq(Truby::Token.new(:nil, 'nil')) }
  end

  describe '.true' do
    specify { expect(described_class.true).to eq(Truby::Token.new(:true, 'true')) }
  end
end
