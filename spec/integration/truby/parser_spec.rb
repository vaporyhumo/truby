# typed: false
# frozen_string_literal: true

describe Truby::Parser do
  let(:actual) { described_class.(input) }

  context 'when given "false"' do
    let(:input) { 'false' }
    let(:tokens) { [t(:false, 'false')] }
    let(:expected) { s(:false, tokens) }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "true"' do
    let(:input) { 'true' }
    let(:tokens) { [t(:true, 'true')] }
    let(:expected) { s(:true, tokens) }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "nil"' do
    let(:input) { 'nil' }
    let(:tokens) { [t(:nil, 'nil')] }
    let(:expected) { s :nil, tokens }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "1"' do
    let(:input) { '1' }
    let(:tokens) { [t(:int, '1')] }
    let(:expected) { s :int, '1', tokens }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "1"' do
    let(:input) { '-1' }
    let(:tokens) { [t(:int, '-1')] }
    let(:expected) { s :int, '-1', tokens }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "foo=true"' do
    let(:input) { 'foo=true' }
    let(:tokens) { [t(:id, 'foo'), t(:assign, '='), true_token] }
    let(:true_token) { t(:true, 'true') }
    let(:expected) { s(:lvar_assign, 'foo', s(:true, [true_token]), tokens) }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "Boolean"' do
    let(:input) { 'Boolean' }
    let(:tokens) { [t(:const, 'Boolean')] }
    let(:expected) { Truby::Node::Const::new receiver: nil, name: 'Boolean', tokens: tokens }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "Boolean "' do
    let(:input) { 'Boolean ' }
    let(:tokens) { [t(:const, 'Boolean'), t(:empty, ' ')] }
    let(:expected) { Truby::Node::Const::new receiver: nil, name: 'Boolean', tokens: tokens }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "Boolean foo"' do
    let(:input) { 'Boolean foo' }
    let(:const) { s(:const, nil, 'Boolean', [t(:const, 'Boolean'), t(:empty, ' ')]) }
    let(:expected) { s :tsend, const, nil, 'foo', [t(:id, 'foo')] }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "Boolean foo="' do
    let(:input) { 'Boolean foo=' }
    let(:const) { s(:const, nil, 'Boolean', [t(:const, 'Boolean'), t(:empty, ' ')]) }
    let(:expected) { s :tlvar_assign, const, 'foo', nil, [t(:id, 'foo'), t(:assign, '=')] }

    specify { expect(actual).to eq(expected) }
  end

  context 'when given "Boolean foo=true"' do
    let(:input) { 'Boolean foo=true' }
    let(:const) { s :const, nil, 'Boolean' }
    let(:true_node) { s :true, [t(:true, 'true')] }
    let(:expected) { s :tlvar_assign, const, 'foo', true_node, [t(:id, 'foo'), t(:assign, '=')] }

    specify { expect(actual).to eq(expected) }
  end
end
