# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class TSend < Struct
      include Node

      const :type, Const
      const :receiver, NilNode
      const :message, String
      const :tokens, T::Array[Token]

      sig { override.params(token: Token).returns Node }
      def add token
        # case token.type
        # when TokenType::Assign then
        s(:tlvar_assign, type, message, nil, [*tokens, token])
        # end
      end

      sig { override.returns String }
      def transpile
        raise
      end

      sig { override.returns String }
      def to_s
        "(tsend #{type} #{receiver || 'nil'} #{message} #{display_tokens})"
      end
    end
  end
end
