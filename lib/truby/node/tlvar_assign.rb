# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class TlvarAssign < Struct
      include Node

      const :type, Const
      const :id, String
      const :value, NilNode
      const :tokens, TokenArray

      sig { override.params(token: Token).returns Node }
      def add token
        case token.type
        when TokenType::True then TlvarAssign::new type: type, id: id, value: nil, tokens: [*tokens, token]
        else raise "#{token.type}"
        end
      end

      sig { override.returns String }
      def transpile
        raise
      end

      sig { override.returns String }
      def to_s
        "(tlvarasgn #{type} #{id} #{value || 'nil'} #{display_tokens})"
      end
    end
  end
end
