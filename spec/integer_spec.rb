# frozen_string_literal: true

describe Truby do
  it do
    expect(described_class.transpile(<<~INPUT.chomp)).to eq(<<~OUTPUT.chomp)
      123
    INPUT
      123
    OUTPUT
  end

  it do
    expect(described_class.transpile(<<~INPUT.chomp)).to eq(<<~OUTPUT.chomp)
      -123
    INPUT
      -123
    OUTPUT
  end

  it do
    expect(described_class.transpile(<<~INPUT.chomp)).to eq(<<~OUTPUT.chomp)
      __LINE__
    INPUT
      __LINE__
    OUTPUT
  end
end
