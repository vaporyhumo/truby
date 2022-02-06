# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Const < Struct
      include Node

      const :receiver, T.nilable(::String)
      const :name,     ::String
      const :tokens,   T::Array[Token]

      sig { params(token: Token).returns Node }
      def add token
        case token.type
        when TokenType::Empty then Const::new receiver: nil, name: name, tokens: [*tokens, token]
        else raise TypeError, "Invalid TokenType #{token.type.serialize}"
        end
      end
    end
  end
end
