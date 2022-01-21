# frozen_string_literal: true

module Truby
  class Node
    class False < self
      include Equality

      def initialize _type = nil
        @type = :false
      end

      def transpile
        'false'
      end

      def unparse
        'false'
      end

      def == other
        other.instance_of? self.class
      end
    end
  end
end
