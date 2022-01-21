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
      TokenFactory::for(last_lexeme_with char).then do |maybe_token|
        case maybe_token
        when Token
          TokenList::new [*tokens[0..-2], maybe_token]
        else
          TokenList::new [*tokens, TokenFactory::for(char)]
        end
      end
    end

    def last_lexeme_with char
      last_lexeme + char
    end

    def last_lexeme
      last&.value || ''
    end
  end
end
