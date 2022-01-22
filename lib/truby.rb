# frozen_string_literal: true

require 'sorbet-runtime'
require "zeitwerk"

class Module
  include T::Sig
end

loader = Zeitwerk::Loader.for_gem
loader.enable_reloading
loader.setup

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

require_relative 'truby/type_alias'
loader.eager_load
