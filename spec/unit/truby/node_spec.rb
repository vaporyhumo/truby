# frozen_string_literal: true

describe Truby::Node do
  describe '.empty' do
    specify { expect(Truby::Node::empty).to be_a Truby::Node::Empty }
  end

  describe '#==' do
    specify { expect(s :empty, []).to eq s :empty, [] }
    specify { expect(s :empty, []).not_to eq s :nil, [t(:nil, 'nil')] }
    specify { expect(s :empty, []).not_to eq s :empty, [t(:int, '1')] }
    specify { expect(s(:empty, [t(:int, '2')])).not_to eq s :empty, [t(:int, '1')] }
    specify { expect(s(:empty, [t(:int, '1')])).to eq s :empty, [t(:int, '1')] }
  end

  describe '#add' do
    specify { expect { s(:int, '1', [t(:int, '1')]).add }.to raise_error(ArgumentError) }
    specify { expect { s(:int, '1', [t(:int, '1')]).add t :int, '1' }.to raise_error ArgumentError, 'Cannot add [int 1] to (int 1)' }
  end
end
