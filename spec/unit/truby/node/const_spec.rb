# typed: false
# frozen_string_literal: true

describe Truby::Node::Const do
  describe '#add' do
    context 'when given an empty token' do
      let(:actual) { s(:const, nil, 'Const', [t(:const, 'Const')]).add(t(:empty, ' ')) }
      let(:tokens) { [t(:const, 'Const'), t(:empty, ' ')] }

      specify do
        expect(actual).to eq s(:const, nil, 'Const', tokens)
      end
    end

    context 'when given a const token' do
      let(:actual) { s(:const, nil, 'Const', [t(:const, 'Const')]).add(t(:const, 'Const')) }

      specify do
        expect { actual }.to raise_error TypeError, 'Invalid TokenType const'
      end
    end

    describe '#transpile' do
      specify {
        expect(s(:const, nil, 'Const').transpile).to eq 'Const'
      }
    end
  end
end
