# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Nil
      include Equality
      include Node

      sig { params(tokens: T::Array[Token]).void }
      def initialize tokens
        @tokens = tokens
      end

      sig { returns T::Array[Token] }
      attr_reader :tokens

      sig { returns String }
      def transpile
        'nil'
      end

      sig { returns String }
      def unparse
        'nil'
      end

      sig { params(other: Object).returns(T::Boolean) }
      def == other
        return false unless other.is_a?(Nil)

        tokens.zip(other.tokens).all? { |a, b| a == b }
      end
    end
  end
end
