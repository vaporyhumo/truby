# typed: false
# frozen_string_literal: true

describe Truby::Node::Empty do
  describe '#initialize' do
    specify { expect(described_class.new).to be_a(described_class) }
    specify { expect(described_class::new([t(:id, 'foo')]).tokens).to eq([t(:id, 'foo')]) }
  end

  describe '#add' do
    specify {
      expect(described_class.new.add(t(:false, 'false'))).to eq Truby::Node::False::new([t(:false, 'false')])
    }

    specify {
      expect(described_class.new.add(t(:nil, 'nil'))).to eq Truby::Node::Nil::new([t(:nil, 'nil')])
    }

    specify {
      expect(described_class.new.add(t(:true, 'true'))).to eq Truby::Node::True::new([t(:true, 'true')])
    }

    specify {
      node = described_class.new.add(t(:int, '1'))
      expect(node).to eq Truby::Node::Int::new('1', [t(:int, '1')])
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
end
