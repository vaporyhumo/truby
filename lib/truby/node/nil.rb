# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class Nil < Struct
      include Node

      const :tokens, TokenArray, factory: ->() { [] }

      sig { override.returns String }
      def transpile
        'nil'
      end

      sig { override.returns String }
      def inspect
        '(nil)'
      end
    end
  end
end
