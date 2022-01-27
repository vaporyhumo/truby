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
  sig { params(string: String).returns(Truby::TokenList) }
  def self.lex string
    Lexer.(string)
  end

  sig { params(string: String).returns(Truby::Node) }
  def self.parse string
    Parser.(string)
  end
end

module Kernel
  sig {
    params(symbol_or_array: T.any(Symbol, T::Array[[Symbol, String]]), string: T.nilable(String))
      .returns(T.any(Truby::Token, Truby::TokenList))
  }
  def t(symbol_or_array, string = nil)
    case symbol_or_array
    when Symbol then Truby::Token.new(symbol_or_array, T.must(string))
    when Array then Truby::TokenList.new(symbol_or_array.map { |(symbol, value)| Truby::Token.new(symbol, value) })
    # :nocov:
    else T.absurd(symbol_or_array)
    # :nocov:
    end
  end
end

require_relative 'truby/type_alias'
loader.eager_load
