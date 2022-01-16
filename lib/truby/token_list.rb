# frozen_string_literal: true

module Truby
  TokenList = DataType.new tokens: Array do
    def self.empty
      TokenList new Array::new
    end

    def == other
      Boolean @tokens.zip(other.tokens).all? { _1 == _2 }
    end

    def last
      Token? @tokens.last
    end

    def add char
      TokenList TokenList::new Array TokenFactory::for last_lexeme_with char
    end

    def last_lexeme_with char
      String last_lexeme + char
    end

    def last_lexeme
      String last&.value || ''
    end
  end
end
