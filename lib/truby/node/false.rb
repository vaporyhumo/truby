# frozen_string_literal: true

module Truby
  module Node
    class False
      include Equality
      include Node

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
