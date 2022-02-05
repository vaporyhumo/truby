# frozen_string_literal: true

describe Truby::TokenList do
  describe '.empty' do
    specify {
      expect(described_class.empty).to eq tl([])
    }
  end

  describe '#initialize' do
    specify { expect(described_class.new([])).to be_frozen }
    specify { expect(described_class.new([]).tokens).to match([]) }
  end

  describe '#==' do
    specify {
      expect(tl([[:id, 'foo'], [:id, 'bar']])).to eq(tl([[:id, 'foo'], [:id, 'bar']]))
    }

    specify {
      expect(tl([[:id, 'foo'], [:id, 'bar']])).not_to eq(tl([[:id, 'foo'], [:id, 'baz']]))
    }

    specify {
      expect(tl([[:id, 'foo'], [:id, 'bar']])).not_to eq(tl([[:id, 'foo'], [:id, 'baz']]))
    }

    specify {
      expect(tl([[:id, 'foo'], [:id, 'bar']])).not_to eq(tl([[:id, 'foo']]))
    }
  end

  describe '#add' do
    specify {
      expect(tl([]).add(Truby::Char::new(char: 'f'))).to eq tl([[:id, 'f']])
    }

    specify {
      expect(tl([[:id, 'f']]).add(Truby::Char::new(char: 'o'))).to eq tl([[:id, 'fo']])
    }

    specify {
      expect(tl([[:id, 'f']]).add(Truby::Char::new(char: '='))).to eq tl([[:id, 'f'], [:assign, '=']])
    }

    specify {
      expect(tl([[:id, 'f']]).add(Truby::Char::new(char: '=')).add(Truby::Char::new(char: 'f'))).to eq tl([[:id, 'f'], [:assign, '='], [:id, 'f']])
    }
  end

  describe '#new_token_list_with_last_token_replaced' do
    specify {
      expect(tl([[:id, 'foo'], [:id, 'foo'], [:id, 'foo'], [:id, 'bar']]).new_token_list_with_last_token_replaced(t(:id, 'baz'))).to(
        eq tl([[:id, 'foo'], [:id, 'foo'], [:id, 'foo'], [:id, 'baz']])
      )
    }

    specify {
      expect(tl([[:id, 'foo'], [:id, 'foo'], [:id, 'bar']]).new_token_list_with_last_token_replaced(t(:id, 'baz'))).to(
        eq tl([[:id, 'foo'], [:id, 'foo'], [:id, 'baz']])
      )
    }
  end
end
