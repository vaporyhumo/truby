# frozen_string_literal: true

require_relative 'truby/config'
require_relative 'truby/equality'
require_relative 'truby/data_type'
require_relative 'truby/lexer'
require_relative 'truby/node'
require_relative 'truby/node/empty'
require_relative 'truby/node/false'
require_relative 'truby/node/int'
require_relative 'truby/node/nil'
require_relative 'truby/node/true'
require_relative 'truby/singleton'
require_relative 'truby/token'
require_relative 'truby/token_list'
require_relative 'truby/token_factory'

module Truby
  def self.lex string
    Lexer.(string)
  end

  def self.parse string
    lex(string).tokens.reduce Node.empty, &method(:parse_step)
  end

  def self.parse_step node, token
    node.add token
  end

  def self.transpile string
    parse(string).transpile
  end

  def self.rewrite string
    parse(string).unparse
  end
end
