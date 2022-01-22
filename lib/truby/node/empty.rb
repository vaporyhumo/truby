# typed: true
# frozen_string_literal: true

module Truby
  module Node
    class Empty
      include Node

      def initialize
        @type = :empty
      end

      sig { params(token: Token).returns Node }
      def add token
        case token.type
        when TokenType::False then Node::false
        when TokenType::Nil   then Node::nil
        when TokenType::True  then Node::true
        when TokenType::Int   then Node::int token.value
        when TokenType::Id    then Send::new receiver: nil, message: token.value, tokens: [token]
        else raise TypeError, "Invalid TokenType #{token.type}"
        end
      end
    end
  end
end
