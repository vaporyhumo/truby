module Truby
  class Node
    class Int < self
      def initialize _type = nil, value
        @type = :int
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
