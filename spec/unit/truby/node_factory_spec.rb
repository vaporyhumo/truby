# typed: false
# frozen_string_literal: true

describe Truby::NodeFactory do
  describe '#s' do
    specify do
      expect(s(:const, nil, 'Const', [t(:const, 'Const')])).to be_a Truby::Node::Const
    end
  end
end
