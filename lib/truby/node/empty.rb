# frozen_string_literal: true

module Truby
  class Node
    class Empty < Node
      def initialize
        @type = :empty
      end

      def to_s
        'empty'
      end
    end
  end
end
