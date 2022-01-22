# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Send
      include Node

      NilNode = T.type_alias { T.nilable(Node) }
      sig { params(receiver: NilNode, message: String, tokens: T::Array[Token]).void }
      def initialize(receiver:, message:, tokens:)
        @receiver = receiver
        @message = message
        @tokens = tokens
      end
    end
  end
end
