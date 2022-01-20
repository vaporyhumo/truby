# frozen_string_literal: true

module Truby
  # Token = DataType.new type: Symbol, value: String
  class Token
    extend DataType

    define_type type: Symbol, value: String
  end
end
