# frozen_string_literal: true

describe Truby::Node do
  describe '.empty' do
    specify { expect(Truby::Node::empty).to be_a Truby::Node::Empty }
  end
end
