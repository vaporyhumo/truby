# typed: strict
# frozen_string_literal: true


module Truby
  class TokenList
    sig { returns TokenList }
    def self.empty
      new Array::new
    end

    sig { params(tokens: T::Array[Token]).void }
    def initialize tokens
      @tokens = tokens
      freeze
    end

    sig { returns T::Array[Token] }
    attr_reader :tokens

    sig { params(other: TokenList).returns T::Boolean }
    def == other
      tokens.size.equal?(other.tokens.size) && tokens.zip(other.tokens).all? { _1 == _2 }
    end

    sig { returns NilToken }
    def last
      tokens.last
    end

    sig { params(char: Char).returns TokenList }
    def add char
      maybe_token_for_last_lexeme_with(char).then do |maybe_token|
        case maybe_token
        when Token then new_token_list_with_last_token_replaced maybe_token
        else new_token_list_with_new_token_for char
        end
      end
    end

    sig { params(char: Char).returns NilToken }
    def maybe_token_for_last_lexeme_with char
      TokenFactory::for last_lexeme_with char
    end

    sig { params(token: Token).returns TokenList }
    def new_token_list_with_last_token_replaced token
      TokenList::new [*tokens[..-2], token]
    end

    sig { params(char: Char).returns TokenList }
    def new_token_list_with_new_token_for char
      TokenList::new [*tokens, token_for_char(char)]
    end

    sig { params(char: Char).returns Token }
    def token_for_char char
      TokenFactory::for_char char
    end

    sig { params(char: Char).returns String }
    def last_lexeme_with char
      last_lexeme + char.char
    end

    sig { returns String }
    def last_lexeme
      last&.value || ''
    end
  end
end
