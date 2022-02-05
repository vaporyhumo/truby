# typed: strict
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
  sig { params(string: String).returns Truby::TokenList }
  def self.lex string
    Lexer::(string)
  end

  sig { params(string: String).returns Truby::Node }
  def self.parse string
    Parser::(string)
  end

  sig { params(char: String).returns Truby::Char }
  def self.char char
    Char::new char: char
  end
end

require_relative 'truby/type_alias'
loader.eager_load
