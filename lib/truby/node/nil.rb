# frozen_string_literal: true

module Truby
  class Node
    class Nil < self
      def initialize _type = nil
        @type = :nil
      end

      def transpile
        String 'nil'
      end

      def unparse
        String 'nil'
      end

      def == other
        Boolean other.instance_of? self.class
      end
    end
  end
end
