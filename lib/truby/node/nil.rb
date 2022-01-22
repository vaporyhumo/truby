# frozen_string_literal: true

module Truby
  module Node
    class Nil
      include Node

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
