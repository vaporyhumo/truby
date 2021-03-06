# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Send < Struct
      include Node

      const :receiver, NilNode
      const :message, String
      const :tokens, T::Array[Token]

      sig { params(token: Token).returns Node }
      def add token
        # case token.type
        # when TokenType::Assign then
        s :lvar_assign, message, nil, [*tokens, token]
        # else super
        # end
      end

      sig { override.returns String }
      def transpile
        raise
      end

      sig { override.returns String }
      def inspect
        "(send #{receiver.inspect} #{message})"
      end
    end
  end
end
