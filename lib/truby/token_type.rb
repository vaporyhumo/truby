# typed: strict
# frozen_string_literal: true

module Truby
  class TokenType < T::Enum
    enums do
      Assign = new
      Colon  = new
      False  = new
      Id     = new
      Int    = new
      Minus  = new
      Nil    = new
      Symbol = new
      True   = new
    end
  end
end
