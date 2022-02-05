# typed: strict
# frozen_string_literal: true

module Truby
  module TokenFactory
    sig { params(lexeme: String).returns NilToken }
    def self.for lexeme
      case lexeme
      when 'false'            then :false
      when 'true'             then :true
      when 'nil'              then :nil
      when '-'                then :minus
      when '='                then :assign
      when ':'                then :colon
      when ' '                then :empty
      when /-?\d+/            then :int
      when /\A:[a-z]+\z/      then :symbol
      when /\A[a-z]+\z/       then :id
      when /\A[A-z][a-z]*\z/  then :const
      end&.then { t _1, lexeme }
    end

    sig { params(char: Char).returns Token }
    def self.for_char char
      self.for(char.char) || raise(ArgumentError, "Unknown char: #{char.char}")
    end

    sig { params(type: Symbol, lexeme: String).returns Token }
    def self.t type, lexeme
      Token::new type: TokenType::deserialize(type.to_s), lexeme: lexeme
    end

    sig { params(type: Symbol, lexeme: String).returns Token }
    def t type, lexeme
      TokenFactory::t type, lexeme
    end

    sig { params(token_args: T::Array[[Symbol, String]]).returns TokenList }
    def tl token_args
      TokenList::new token_args.map { |(type, lexeme)| t type, lexeme }
    end
  end
end
