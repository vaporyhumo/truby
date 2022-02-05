# frozen_string_literal: true

describe Truby::TokenFactory do
  def assert_equal actual, expected
    expect(actual).to eq expected
  end

  describe '.for' do
    context 'when given "nil"' do
      let(:actual) { described_class.for('nil') }
      let(:expected) { t(:nil, Truby::Config::NIL) }

      specify { assert_equal actual, expected }
    end

    context 'when given "true"' do
      let(:actual) { described_class.for('true') }
      let(:expected) { t(:true, Truby::Config::TRUE) }

      specify { assert_equal actual, expected }
    end

    context 'when given "false"' do
      let(:actual) { described_class.for('false') }
      let(:expected) { t(:false, Truby::Config::FALSE) }

      specify { assert_equal actual, expected }
    end

    context 'when given "-"' do
      let(:actual) { described_class.for('-') }
      let(:expected) { t(:minus, '-') }

      specify { assert_equal actual, expected }
    end

    context 'when given "="' do
      let(:actual) { described_class.for('=') }
      let(:expected) { t(:assign, '=') }

      specify { assert_equal actual, expected }
    end

    context 'when given "1"' do
      let(:actual) { described_class.for('1') }
      let(:expected) { t(:int, '1') }

      specify { assert_equal actual, expected }
    end

    context 'when given ":"' do
      let(:actual) { described_class.for(':') }
      let(:expected) { t(:colon, ':') }

      specify { assert_equal actual, expected }
    end

    context 'when given ":foo"' do
      let(:actual) { described_class.for(':foo') }
      let(:expected) { t(:symbol, ':foo') }

      specify { assert_equal actual, expected }
    end

    context 'when given "foo"' do
      let(:actual) { described_class.for('foo') }
      let(:expected) { t(:id, 'foo') }

      specify { assert_equal actual, expected }
    end

    context 'when given "::"' do
      let(:actual) { described_class.for('::') }

      specify { assert_equal actual, nil }
    end
  end

  describe '.for_char' do
    context 'when given "-"' do
      let(:actual) { described_class.for_char(Truby::char('-')) }
      let(:expected) { t(:minus, '-') }

      specify { assert_equal actual, expected }
    end

    context 'when given "="' do
      let(:actual) { described_class.for_char(Truby::char('=')) }
      let(:expected) { t(:assign, '=') }

      specify { assert_equal actual, expected }
    end

    context 'when given ":"' do
      let(:actual) { described_class.for_char(Truby::char(':')) }
      let(:expected) { t(:colon, ':') }

      specify { assert_equal actual, expected }
    end

    context 'when given "a"' do
      let(:actual) { described_class.for_char(Truby::char('a')) }
      let(:expected) { t(:id, 'a') }

      specify { assert_equal actual, expected }
    end

    context 'when given "A"' do
      let(:actual) { described_class.for_char(Truby::char('A')) }
      let(:expected) { t(:const, 'A') }

      specify { assert_equal actual, expected }
    end

    context 'when given "A"' do
      let(:actual) { described_class.for_char(Truby::char('<')) }

      specify { expect { actual }.to raise_error ArgumentError, 'Unknown char: <' }
    end
  end

  describe '#tl' do
    specify do
      tl([[:id, 'foo']]).tap do |list|
        expect(list).to be_a Truby::TokenList
        expect(list.tokens.size).to eq 1
        expect(list.tokens.first).to be_a Truby::Token
      end
    end
  end
end
