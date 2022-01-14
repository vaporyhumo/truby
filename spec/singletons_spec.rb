# frozen_string_literal: true

describe Truby do
  it do
    expect(described_class.transpile(<<~INPUT.chomp)).to eq(<<~OUTPUT.chomp)
      nil
    INPUT
      nil
    OUTPUT
  end

  it do
    expect(described_class.transpile(<<~INPUT.chomp)).to eq(<<~OUTPUT.chomp)
      true
    INPUT
      true
    OUTPUT
  end

  it do
    expect(described_class.transpile(<<~INPUT.chomp)).to eq(<<~OUTPUT.chomp)
      false
    INPUT
      false
    OUTPUT
  end
end
