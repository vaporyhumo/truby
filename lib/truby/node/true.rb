# frozen_string_literal: true

module Truby
  class Node
    class True < self
      def initialize _type = nil
        @type = :true
      end

      def transpile
        'true'
      end

      def unparse
        'true'
      end

      def == other
        other.instance_of? self.class
      end
    end
  end
end
