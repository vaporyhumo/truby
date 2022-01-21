# frozen_string_literal: true

module Truby
  class Node
    class Nil < self
      def initialize _type = nil
        @type = :nil
      end

      def transpile
        'nil'
      end

      def unparse
        'nil'
      end

      def == other
        other.instance_of? self.class
      end
    end
  end
end
