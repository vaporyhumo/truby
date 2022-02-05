# frozen_string_literal: true

describe Truby::Lexer do
  include Truby::TokenFactory

  describe '.call' do
    let(:actual) { described_class.(input) }
    let(:expected) { Truby::TokenList::new tokens }

    context 'when given "nil"' do
      let(:input) { 'nil' }
      let(:tokens) { [t(:nil, 'nil')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "true"' do
      let(:input) { 'true' }
      let(:tokens) { [t(:true, 'true')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "false"' do
      let(:input) { 'false' }
      let(:tokens) { [t(:false, 'false')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "1"' do
      let(:input) { '1' }
      let(:tokens) { [t(:int, '1')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "-1"' do
      let(:input) { '-1' }
      let(:tokens) { [t(:int, '-1')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given ":symbol"' do
      let(:input) { ':symbol' }
      let(:tokens) { [t(:symbol, ':symbol')] }

      specify { expect(actual).to match(expected) }
    end

    context 'when given "foo=true"' do
      let(:input) { 'foo=true' }
      let(:tokens) { [[:id, 'foo'], [:assign, '='], [:true, 'true']].map { t(_1, _2) } }

      specify { expect(described_class.(input)).to match(expected) }
    end
  end
end
