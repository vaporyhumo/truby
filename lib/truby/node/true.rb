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

      sig { params(other: Object).returns T::Boolean }
      def == other
        other.instance_of? self.class
      end
    end
  end
end
