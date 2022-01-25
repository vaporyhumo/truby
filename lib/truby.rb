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

require_relative 'truby/type_alias'
loader.eager_load
