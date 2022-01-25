# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Send
      include Node

      NilNode = T.type_alias { T.nilable(Node) }
      sig { params(receiver: NilNode, message: String, tokens: T::Array[Token]).void }
      def initialize receiver:, message:, tokens:
        @receiver = receiver
        @message = message
        @tokens = tokens
      end

      sig { returns T::Array[Token] }
      attr_reader :tokens

      sig { params(token: Token).returns Node }
      def add token
        case token.type
        when TokenType::Assign then Node::lvar_assign @message, nil, [*@tokens, token]
        else super
        end
      end


      sig { override.returns String }
      def inspect
        "(send #{@receiver.inspect} #{@message})"
      end
    end
  end
end
