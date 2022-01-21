# frozen_string_literal: true

module Truby
  module TokenFactory
    extend T::Sig

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

    NilToken = T.type_alias { T.nilable Token }
    sig { params(lexeme: String).returns NilToken }
    def self.for(lexeme)
      case lexeme
      when Singleton     then send lexeme
      when '-'           then Token::new :minus, lexeme
      when '='           then Token::new :assign, lexeme
      when /-?\d+/       then Token::new :int, lexeme
      when /\A:\z/       then Token::new :colon, lexeme
      when /\A:[a-z]+\z/ then Token::new :symbol, lexeme
      when /\A[a-z]+\z/  then Token::new :id,  lexeme
      end
    end
  end
end
