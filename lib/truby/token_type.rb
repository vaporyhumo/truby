# typed: strict
# frozen_string_literal: true

module Truby
  class TokenType < T::Enum
    enums do
      Assign = new
      Colon  = new
      Const  = new
      Empty  = new
      False  = new
      Id     = new
      Int    = new
      Minus  = new
      Nil    = new
      Symbol = new
      True   = new

      Debug  = new
    end
  end
end
