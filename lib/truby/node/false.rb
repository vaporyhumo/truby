# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class False < Struct
      include Node

      const :tokens, TokenArray

      sig { override.returns String }
      def transpile
        'false'
      end

      sig { override.returns String }
      def inspect
        '(false)'
      end
    end
  end
end
