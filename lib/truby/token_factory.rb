# typed: true
# frozen_string_literal: true

module Truby
  module TokenFactory
    sig { returns Token }
    def self.nil
      Token::new :nil, Config::NIL
    end

    sig { returns Token }
    def self.true
      Token::new :true, Config::TRUE
    end

    sig { returns Token }
    def self.false
      Token::new :false, Config::FALSE
    end

    sig { params(lexeme: String).returns NilToken }
    def self.for lexeme
      case lexeme
      when Singleton     then public_send lexeme
      when '-'           then Token::new :minus, lexeme
      when '='           then Token::new :assign, lexeme
      when /-?\d+/       then Token::new :int, lexeme
      when /\A:\z/       then Token::new :colon, lexeme
      when /\A:[a-z]+\z/ then Token::new :symbol, lexeme
      when /\A[a-z]+\z/  then Token::new :id,  lexeme
      when /\A[A-z][a-z]*\z/  then Token::new :const,  lexeme
      end
    end

    sig { params(char: Char).returns Token }
    def self.for_char char
      case char.char
      when '-'           then Token::new :minus, char.char
      when '='           then Token::new :assign, char.char
      when ':'           then Token::new :colon, char.char
      when ' '           then Token::new :empty, char.char
      when ('a'..'z')    then Token::new :id,  char.char
      when ('A'..'Z')    then Token::new :const, char.char
      else raise "#{char.char}"
      end
    end
  end
end
