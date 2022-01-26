# frozen_string_literal: true

module Truby
  module Lexer
    def self.call string
      string.each_char.reduce TokenList::empty, &public_method(:step)
    end

    def self.step tokens, char
      tokens.add char
    end
  end
end
