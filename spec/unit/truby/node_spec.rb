# frozen_string_literal: true

describe Truby::Node do
  describe '.empty' do
    specify { expect(Truby::Node::empty).to be_a Truby::Node::Empty }
  end

  describe '#==' do
    specify { expect(Truby::Node::empty).to eq Truby::Node::Empty::new }
    specify { expect(Truby::Node::empty).not_to eq Truby::Node::Nil::new [] }
    specify { expect(Truby::Node::empty).not_to eq Truby::Node::Empty::new [t(:int, '1')] }
    specify { expect(Truby::Node::Empty::new([t(:int, '2')])).not_to eq Truby::Node::Empty::new [t(:int, '1')] }
    specify { expect(Truby::Node::Empty::new([t(:int, '1')])).to eq Truby::Node::Empty::new [t(:int, '1')] }
  end

  describe '#add' do
    specify { expect { Truby::Node::Int::new('1', [t(:int, '1')]).add }.to raise_error(ArgumentError) }
    specify { expect { Truby::Node::Int::new('1', [t(:int, '1')]).add(t(:int, '1')) }.to raise_error(ArgumentError, 'Cannot add [int 1] to (int 1)') }
  end
end
