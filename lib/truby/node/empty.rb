# typed: true
# frozen_string_literal: true

module Truby
  class Node
    class Empty < Node
      def initialize
        @type = :empty
      end

      sig { params(token: Token).returns Node }
      def add token
        case token.type
        when :false then Node::false
        when :nil   then Node::nil
        when :true  then Node::true
        when :int   then Node::int token.value
        else raise 'invalid node type'
        end
      end
    end
  end
end
