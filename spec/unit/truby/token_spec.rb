# frozen_string_literal: true

describe Truby::Token do
  describe '#inspect' do
    specify {
      expect(Truby::Token.new(:int, 'bar').inspect).to eq('[int bar]')
    }
  end
end
