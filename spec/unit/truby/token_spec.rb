# frozen_string_literal: true

describe Truby::Token do
  describe '#to_s' do
    specify {
      expect(t(:int, 'bar').inspect).to eq('[int bar]')
    }
  end
end
