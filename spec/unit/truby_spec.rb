# frozen_string_literal: true

describe Truby do
  describe '.lex' do
    specify {
      allow(Truby::Lexer).to receive(:call).and_call_original
      described_class.lex('foo')
      expect(Truby::Lexer).to have_received(:call).with('foo')
    }
  end

  describe '.parse' do
    specify {
      allow(Truby::Parser).to receive(:call).and_call_original
      described_class.parse('foo')
      expect(Truby::Parser).to have_received(:call).with('foo')
    }
  end
end
