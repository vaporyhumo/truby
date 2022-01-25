# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Empty
      include Node

      sig { void }
      def initialize
        @tokens = T.let([], T::Array[Token])
      end

      sig { returns T::Array[Token] }
      attr_reader :tokens

      sig { params(token: Token).returns Node }
      def add token
        case token.type
        when TokenType::False then Node::False::new [token]
        when TokenType::Nil   then Node::Nil::new [token]
        when TokenType::True  then Node::True::new [token]
        when TokenType::Int   then Node::Int::new token.value, [token]
        when TokenType::Id    then Send::new receiver: nil, message: token.value, tokens: [token]
        else raise TypeError, "Invalid TokenType #{token.type}"
        end
      end
    end
  end
end
