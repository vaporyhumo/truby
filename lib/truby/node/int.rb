# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Int < Struct
      include Node

      const :value, String
      const :tokens, TokenArray

      sig { override.returns String }
      def transpile
        value
      end

      sig { override.returns String }
      def to_s
        "(int #{value})"
      end
    end
  end
end
