# frozen_string_literal: true

module Truby
  module TokenFactory
    def self.nil
      Token::new :nil, Config::NIL
    end

    def self.true
      Token::new :true, Config::TRUE
    end

    def self.false
      Token::new :false, Config::FALSE
    end

    def self.for(lexeme)
      case lexeme
      when Singleton then send lexeme
      when /-?\d+/   then Token::new :int, lexeme
      when /:[a-z]+/ then Token::new :symbol, lexeme
      when String    then Token::new :id,  lexeme
      end
    end
  end
end
