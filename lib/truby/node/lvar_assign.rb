# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class LvarAssign < Struct
      include Node

      const :id, String
      const :value, NilNode
      const :tokens, TokenArray

      sig { override.returns String }
      def to_s
        "(lvarasgn #{id} #{value.inspect} #{display_tokens})"
      end

      sig { override.returns String }
      def transpile
        raise
      end

      sig { params(token: Token).returns Node }
      def add token
        # case token.type
        # when TokenType::True then
        LvarAssign::new id: id, value: s(:true, [token]), tokens: [*tokens, token]
        # else super
        # end
      end
    end
  end
end
