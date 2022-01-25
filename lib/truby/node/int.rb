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

      sig { returns T::Array[Token] }
      attr_reader :tokens

      sig { params(other: Object).returns(T::Boolean) }
      def == other
        case other
        when Int
          value == other.value
        else false
        end
      end

      sig { returns String }
      def unparse
        value.to_s
      end

      sig { returns String }
      def transpile
        value.to_s
      end
    end
  end
end
