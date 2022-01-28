# typed: false
# frozen_string_literal: true

describe Truby::Parser do
  let(:actual) { described_class.(input) }

  context 'when given "false"' do
    let(:input) { 'false' }
    let(:tokens) { [t(:false, 'false')] }
    let(:expected) { Truby::Node::False::new(tokens) }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "true"' do
    let(:input) { 'true' }
    let(:tokens) { [t(:true, 'true')] }
    let(:expected) { Truby::Node::True::new(tokens) }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "nil"' do
    let(:input) { 'nil' }
    let(:tokens) { [t(:nil, 'nil')] }
    let(:expected) { Truby::Node::Nil::new(tokens) }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "1"' do
    let(:input) { '1' }
    let(:tokens) { [t(:int, '1')] }
    let(:expected) { Truby::Node::Int::new('1', tokens) }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "1"' do
    let(:input) { '-1' }
    let(:tokens) { [t(:int, '-1')] }
    let(:expected) { Truby::Node::Int::new('-1', tokens) }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "foo=true"' do
    let(:input) { 'foo=true' }
    let(:tokens) { [t(:id, 'foo'), t(:assign, '='), true_token] }
    let(:true_token) { t(:true, 'true') }
    let(:expected) { Truby::Node::LvarAssign::new 'foo', Truby::Node::True::new([true_token]), tokens }

    specify { expect(actual).to eq(expected) }
  end
end
