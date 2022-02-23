# typed: false
# frozen_string_literal: true

describe Truby::Node::Empty do
  describe '#add' do
    specify {
      expect(described_class::new.add(t(:false, 'false'))).to eq s(:false, [t(:false, 'false')])
    }

    specify {
      expect(described_class.new.add(t(:nil, 'nil'))).to eq s :nil, [t(:nil, 'nil')]
    }

    specify {
      expect(described_class.new.add(t(:true, 'true'))).to eq s(:true, [t(:true, 'true')])
    }

    specify {
      node = described_class.new.add t(:int, '1')
      expect(node).to eq s :int, '1', [t(:int, '1')]
      expect(node.value).to eq '1'
    }

    specify {
      expect(described_class.new.add(t(:id, 'foo'))).to eq Truby::Node::Send::new(receiver: nil, message: 'foo', tokens: [t(:id, 'foo')])
    }

    specify {
      expect(described_class.new.add(t(:const, 'Const'))).to eq s(:const, nil, 'Const', [t(:const, 'Const')])
    }

    specify {
      expect { described_class.new.add(t(:debug, 'foo')) }.to raise_error TypeError, 'Invalid TokenType #<Truby::TokenType::Debug>'
    }
  end

  describe '#transpile' do
    specify { expect(described_class.new.transpile).to eq '' }
  end
end
