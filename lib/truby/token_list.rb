# frozen_string_literal: true

module Truby
  TokenList = DataType.new tokens: Array do
    def self.empty
      new Array::new
    end

    def == other
      @tokens.zip(other.tokens).all? { _1 == _2 }
    end

    def last
      @tokens.last
    end

    def add char
      TokenList::new Array TokenFactory::for last_lexeme_with char
    end

    def last_lexeme_with char
      last_lexeme + char
    end

    def last_lexeme
      last&.value || ''
    end
  end
end
