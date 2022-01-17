# frozen_string_literal: true

module Truby
  class Node
    class True < self
      def initialize _type = nil
        @type = :true
      end

      def transpile
        String 'true'
      end

      def unparse
        String 'true'
      end

      def == other
        Boolean other.instance_of? self.class
      end
    end
  end
end
