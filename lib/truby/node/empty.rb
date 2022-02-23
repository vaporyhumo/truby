# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Empty < Struct
      include Node

      const :tokens, TokenArray, factory: ->() { [] }

      sig { override.returns String }
      def transpile
        ''
      end

      sig { params(token: Token).returns Node }
      def add token
        case token.type
        when TokenType::False then s :false, [token]
        when TokenType::Nil   then s :nil, [token]
        when TokenType::True  then s :true, [token]
        when TokenType::Int   then s :int, token.lexeme, [token]
        when TokenType::Id    then Send::new message: token.lexeme, tokens: [token]
        when TokenType::Const then Const::new name: token.lexeme, tokens: [token]
        else raise TypeError, "Invalid TokenType #{token.type}"
        end
      end
    end
  end
end
