# typed: true
# frozen_string_literal: true

module Truby
  class Token
    extend Truby::DataType

    define_type type: Symbol, value: String
  end
end
