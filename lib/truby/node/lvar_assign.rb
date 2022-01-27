# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class LvarAssign
      include Node

      sig { params(id: String, value: NilNode, tokens: T::Array[Token]).void }
      def initialize id, value, tokens
        @id = id
        @value = value
        @tokens = tokens
      end

      sig { returns String }
      attr_reader :id

      sig { returns NilNode }
      attr_reader :value

      sig { override.returns T::Array[Token] }
      attr_reader :tokens

      sig { override.returns String }
      def to_s
        "(lvarasgn #{id} #{value.inspect})"
      end

      sig { params(token: Token).returns Node }
      def add token
        case token.type
        when TokenType::True then LvarAssign::new id, True::new([token]), [*tokens, token]
        # else super
        end
      end
    end
  end
end
