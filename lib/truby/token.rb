# frozen_string_literal: true

module Truby
  class Token
    extend DataType

    define_type type: Symbol, value: String
  end
end
