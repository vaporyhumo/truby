# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Empty
      include Node

      sig { params(tokens: T::Array[Token]).void }
      def initialize tokens = []
        @tokens = T.let(tokens, T::Array[Token])
      end

      sig { override.returns T::Array[Token] }
      attr_reader :tokens

      sig { params(token: Token).returns Node }
      def add token
        case token.type
        when TokenType::False then False::new [token]
        when TokenType::Nil   then Nil::new [token]
        when TokenType::True  then True::new [token]
        when TokenType::Int   then Int::new token.lexeme, [token]
        when TokenType::Id    then Send::new receiver: nil, message: token.lexeme, tokens: [token]
        when TokenType::Const then Send::new receiver: nil, message: token.lexeme, tokens: [token]
        else raise TypeError, "Invalid TokenType #{token.type}"
        end
      end
    end
  end
end
