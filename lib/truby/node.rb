# frozen_string_literal: true

module Truby
  class Node
    def self.empty
      Node Empty::new
    end

    def add token
      Node case token.type
      when :false then Node::False::new
      when :nil   then Node::Nil::new
      when :true  then Node::True::new
      when :int   then Node::Int::new token.value
      end
    end
  end
end
