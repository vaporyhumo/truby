# frozen_string_literal: true

require 'sorbet-runtime'

class Module
  include T::Sig
end

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
require_relative 'truby/parser'
require_relative 'truby/singleton'
require_relative 'truby/token'
require_relative 'truby/token_list'
require_relative 'truby/token_factory'
require_relative 'truby/type_alias'

module Truby
  def self.lex string
    Lexer.(string)
  end

  def self.parse string
    Parser.(string)
  end

  def self.transpile string
    parse(string).transpile
  end

  def self.rewrite string
    parse(string).unparse
  end
end
