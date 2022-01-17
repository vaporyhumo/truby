# frozen_string_literal: true

def define_casting_method_for klass
  define_method klass.name.split('::').last.to_sym do |obj|
    obj.tap { raise TypeError, "#{obj.inspect} is not a #{klass}" unless _1.is_a? klass }
  end
end

require_relative 'truby/config'
require_relative 'truby/equality'
require_relative 'truby/data_type'
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

define_casting_method_for Symbol
define_casting_method_for FalseClass
define_casting_method_for NilClass
define_casting_method_for TrueClass
define_casting_method_for Truby::Node
define_casting_method_for Truby::Token
define_casting_method_for Truby::TokenList

def Boolean obj
  TrueClass(obj) rescue FalseClass(obj)
end

def Token? obj
  Token(obj) rescue NilClass(obj)
end

module Truby
  def self.Char string
    String(string).tap { raise TypeError unless _1.size == 1 }
  end

  def self.lex string
    Truby::TokenList String(string).each_char.reduce TokenList.empty, &method(:step)
  end

  def self.step tokens, char
    Truby::TokenList Truby::TokenList(tokens).add Char char
  end

  def self.parse string
    Truby::Node lex(String string).tokens.reduce Node.empty, &method(:parse_step)
  end

  def self.parse_step node, token
    Truby::Node Truby::Node(node).add Truby::Token token
  end

  def self.transpile string
    String parse(String string).transpile
  end

  def self.rewrite string
    String parse(String string).unparse
  end
end
