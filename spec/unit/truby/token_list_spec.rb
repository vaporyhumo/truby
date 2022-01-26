# frozen_string_literal: true

describe Truby::TokenList do
  describe '.empty' do
    specify {
      expect(described_class.empty).to eq t([])
    }
  end

  describe '#initialize' do
    specify { expect(described_class.new([])).to be_frozen }
    specify { expect(described_class.new([]).tokens).to match([]) }
  end

  describe '#==' do
    specify {
      expect(t([[:id, 'foo'], [:id, 'bar']])).to eq(t([[:id, 'foo'], [:id, 'bar']]))
    }

    specify {
      expect(t([[:id, 'foo'], [:id, 'bar']])).not_to eq(t([[:id, 'foo'], [:id, 'baz']]))
    }

    specify {
      expect(t([[:id, 'foo'], [:id, 'bar']])).not_to eq(t([[:id, 'foo'], [:id, 'baz']]))
    }

    specify {
      expect(t([[:id, 'foo'], [:id, 'bar']])).not_to eq(t([[:id, 'foo']]))
    }
  end

  describe '#add' do
    specify {
      expect(t([]).add('f')).to eq t([[:id, 'f']])
    }

    specify {
      expect(t([[:id, 'f']]).add('o')).to eq t([[:id, 'fo']])
    }

    specify {
      expect(t([[:id, 'f']]).add('=')).to eq t([[:id, 'f'], [:assign, '=']])
    }

    specify {
      expect(t([[:id, 'f']]).add('=').add('f')).to eq t([[:id, 'f'], [:assign, '='], [:id, 'f']])
    }
  end

  describe '#new_token_list_with_last_token_replaced' do
    specify {
      expect(t([[:id, 'foo'], [:id, 'foo'], [:id, 'foo'], [:id, 'bar']]).new_token_list_with_last_token_replaced(t(:id, 'baz'))).to(
        eq t([[:id, 'foo'], [:id, 'foo'], [:id, 'foo'], [:id, 'baz']])
      )
    }

    specify {
      expect(t([[:id, 'foo'], [:id, 'foo'], [:id, 'bar']]).new_token_list_with_last_token_replaced(t(:id, 'baz'))).to(
        eq t([[:id, 'foo'], [:id, 'foo'], [:id, 'baz']])
      )
    }
  end
end
