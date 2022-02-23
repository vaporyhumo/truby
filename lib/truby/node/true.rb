# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class True < Struct
      include Node

      const :tokens, TokenArray

      sig { override.returns String }
      def transpile
        'true'
      end

      sig { override.returns String }
      def to_s
        '(true)'
      end
    end
  end
end
