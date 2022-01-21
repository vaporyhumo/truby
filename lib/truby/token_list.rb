# typed: true
# frozen_string_literal: true


module Truby
  class TokenList
    extend Truby::DataType

    define_type tokens: Array

    sig { returns TokenList }
    def self.empty
      new Array::new
    end

    sig { params(other: TokenList).returns T::Boolean }
    def == other
      @tokens.zip(other.tokens).all? { _1 == _2 }
    end

    sig { returns NilToken }
    def last
      @tokens.last
    end

    sig { params(char: String).returns TokenList }
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

    sig { params(char: String).returns String }
    def last_lexeme_with char
      last_lexeme + char
    end

    sig { returns String }
    def last_lexeme
      last&.value || ''
    end
  end
end
