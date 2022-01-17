# frozen_string_literal: true

module Truby
  class Node
    class False < self
      include Equality

      def initialize _type = nil
        @type = :false
      end

      def transpile
        String 'false'
      end

      def unparse
        String 'false'
      end

      def == other
        Boolean other.instance_of? self.class
      end
    end
  end
end
