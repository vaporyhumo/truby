# typed: strict
# frozen_string_literal: true

module Truby
  module Immutable
  end

  class Char
    sig { params(char: String).void }
    def initialize(char:)
      raise unless char.size == 1
      @char = char
      freeze
    end

    sig { returns String }
    attr_reader :char
  end
end
