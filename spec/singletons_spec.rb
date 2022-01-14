# frozen_string_literal: true

describe Truby do
  it do
    expect(described_class.transpile(<<~INPUT.chomp)).to eq(<<~OUTPUT.chomp)
      nil
    INPUT
      nil
    OUTPUT
  end
end
