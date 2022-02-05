# typed: strict
# frozen_string_literal: true

module Truby
  class Token < Struct
    extend Equality

    define_equality :type, :lexeme

    const :type, TokenType
    const :lexeme, String

    sig { returns String }
    def to_s
      "[#{type.serialize} #{lexeme}]"
    end
    alias_method :inspect, :to_s
  end
end
