# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    class True
      include Node

      sig { returns String }
      def transpile
        'true'
      end

      sig { returns String }
      def unparse
        'true'
      end

      sig { override.returns String }
      def inspect
        '(true)'
      end
    end
  end
end
