# frozen_string_literal: true

describe Truby::TokenFactory do
  def assert_equal actual, expected
    expect(actual).to eq expected
  end

  describe '.for' do
    context 'when given "nil"' do
      let(:actual) { described_class.for('nil') }
      let(:expected) { Truby::Token.new(:nil, Truby::Config::NIL) }

      specify { assert_equal actual, expected }
    end

    context 'when given "true"' do
      let(:actual) { described_class.for('true') }
      let(:expected) { Truby::Token.new(:true, Truby::Config::TRUE) }

      specify { assert_equal actual, expected }
    end

    context 'when given "false"' do
      let(:actual) { described_class.for('false') }
      let(:expected) { Truby::Token.new(:false, Truby::Config::FALSE) }

      specify { assert_equal actual, expected }
    end
  end

  describe '.false' do
    let(:actual) { described_class.false }
    let(:expected) { Truby::Token.new(:false, Truby::Config::FALSE) }

    specify { assert_equal actual, expected }
  end

  describe '.nil' do
    let(:actual) { described_class.nil }
    let(:expected) { Truby::Token.new(:nil, Truby::Config::NIL) }

    specify { assert_equal actual, expected }
  end

  describe '.true' do
    let(:actual) { described_class.true }
    let(:expected) { Truby::Token.new(:true, Truby::Config::TRUE) }

    specify { assert_equal actual, expected }
  end
end
