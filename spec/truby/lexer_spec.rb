# frozen_string_literal: true

describe Truby::Lexer do
  describe '.call' do
    let(:actual) { described_class.(input) }
    let(:expected) { Truby::TokenList::new tokens }

    context 'when given "nil"' do
      let(:input) { 'nil' }
      let(:tokens) { [Truby::Token::new(:nil, 'nil')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "true"' do
      let(:input) { 'true' }
      let(:tokens) { [Truby::Token::new(:true, 'true')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "false"' do
      let(:input) { 'false' }
      let(:tokens) { [Truby::Token::new(:false, 'false')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "1"' do
      let(:input) { '1' }
      let(:tokens) { [Truby::Token::new(:int, '1')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "-1"' do
      let(:input) { '-1' }
      let(:tokens) { [Truby::Token::new(:int, '-1')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given ":symbol"' do
      let(:input) { ':symbol' }
      let(:tokens) { [Truby::Token::new(:symbol, ':symbol')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "foo=true"' do
      let(:input) { 'foo=true' }
      let(:tokens) { [[:id, 'foo'], [:assign, '='], [:true, 'true']].map { Truby::Token::new(_1, _2) } }

      specify { expect(described_class.(input)).to match(expected) }
    end
  end
end
