# frozen_string_literal: true

describe Truby do
  it do
    expect(described_class.transpile(<<~INPUT.chomp)).to eq(<<~OUTPUT.chomp)
      :foo
    INPUT
      :foo
    OUTPUT
  end

  it do
    expect(described_class.transpile(<<~INPUT.chomp)).to eq(<<~OUTPUT.chomp)
      :'foo'
    INPUT
      :'foo'
    OUTPUT
  end
end
