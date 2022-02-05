# typed: strict
# frozen_string_literal: true

module Truby
  class Char < Object
    sig { params(char: String).void }
    def initialize(char:)
      raise ArgumentError unless char.size == 1
      @char = char
    end

    sig { returns String }
    attr_reader :char
  end
end
