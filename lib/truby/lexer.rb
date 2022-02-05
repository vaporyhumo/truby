# typed: strict
# frozen_string_literal: true

module Truby
  module Lexer
    sig { params(string: String).returns TokenList }
    def self.call string
      string.each_char.reduce(TokenList::empty) { step _1, _2 }
    end

    sig { params(tokens: TokenList, char: String).returns TokenList }
    def self.step tokens, char
      tokens.add Char::new char: char
    end
  end
end
