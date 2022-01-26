# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Int
      include Node

      sig { params(value: T.untyped, tokens: T::Array[Token]).void }
      def initialize value, tokens
        @value = value
        @tokens = tokens
      end

      sig { returns T.untyped }
      attr_reader :value

      sig { override.returns T::Array[Token] }
      attr_reader :tokens

      sig { override.returns String }
      def inspect
        "(int #{value})"
      end
    end
  end
end
