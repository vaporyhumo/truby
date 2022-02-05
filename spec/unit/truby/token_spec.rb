# frozen_string_literal: true

describe Truby::Token do
  describe '#to_s' do
    specify {
      expect(t(:int, 'bar').to_s).to eq('[int bar]')
    }
  end
end
