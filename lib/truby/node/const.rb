# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Const < Struct
      include Node

      const :receiver, T.nilable(Node)
      const :name,     ::String
      const :tokens,   T::Array[Token]

      sig { params(token: Token).returns Node }
      def add token
        case token.type
        when TokenType::Empty then Const::new receiver: nil, name: name, tokens: [*tokens, token]
        when TokenType::Id    then TSend::new type: self, message: token.lexeme, receiver: nil, tokens: [token]
        else raise TypeError, "Invalid TokenType #{token.type.serialize}"
        end
      end

      sig { override.returns String }
      def transpile
        name
      end

      sig { returns String }
      def to_s
        "(const #{receiver || 'nil'} #{name} #{display_tokens})"
      end
    end
  end
end
