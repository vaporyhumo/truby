module Truby
  module Node
    class Int
      include Node

      def initialize value
        @value = value
      end

      attr_reader :value

      def == other
        other.instance_of?(self.class) && other.value == value
      end

      def unparse
        value.to_s
      end

      def transpile
        value.to_s
      end
    end
  end
end
