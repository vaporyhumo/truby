# typed: false
# frozen_string_literal: true

describe Truby::NodeFactory do
  describe '#s' do
    specify do
      expect(s(:const, nil, 'Const', [t(:const, 'Const')])).to be_a Truby::Node::Const
    end

    specify do
      expect(s(:tsend, s(:const, nil, 'Const', []), nil, 'foo', [])).to be_a Truby::Node::TSend
    end

    specify do
      expect { s(:debug) }.to raise_error(TypeError)
    end
  end
end
