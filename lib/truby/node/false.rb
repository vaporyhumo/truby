# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class False
      include Equality
      include Node

      sig { params(tokens: T::Array[Token]).void }
      def initialize tokens
        @tokens = tokens
      end

      sig { override.returns T::Array[Token] }
      attr_reader :tokens

      sig {override.returns(String)}
      def inspect
        '(false)'
      end
    end
  end
end
