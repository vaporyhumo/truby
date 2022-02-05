# typed: strict
# frozen_string_literal: true

module Truby
  module Parser
    sig { params(string: String).returns Node }
    def self.call string
      Lexer::(string).tokens.reduce(Node::empty) { parse_step _1, _2 }
    end

    sig { params(node: Node, token: Token).returns Node }
    def self.parse_step node, token
      node.add token
    end
  end
end
