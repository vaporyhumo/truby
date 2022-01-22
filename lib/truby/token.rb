# typed: strict
# frozen_string_literal: true

module Truby
  class Token
    extend Equality

    define_equality :type, :value

    sig { params(type: Symbol, value: String).void }
    def initialize(type, value)
      @type = T.let(TokenType::deserialize(type.to_s), TokenType)
      @value = value
    end

    sig { returns TokenType }
    attr_reader :type

    sig { returns String }
    attr_reader :value
  end
end
