# frozen_string_literal: true

describe Truby::Token do
  specify { expect(described_class.__type).to match(type: Symbol, value: String) }
end
