# frozen_string_literal: true

describe Truby::Token do
  describe '#initialize' do
    specify { expect(Truby::Token.new(:id, 'foo')).to be_frozen }
  end

  describe '#inspect' do
    specify {
      expect(t(:int, 'bar').inspect).to eq('[int bar]')
    }
  end
end
