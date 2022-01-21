# typed: true
# frozen_string_literal: true


module Truby
  class TokenList
    extend Truby::DataType

    def self.define_type(*args)
    end

    def initialize tokens
      @tokens = tokens
    end

    def tokens
    end
  end
end
