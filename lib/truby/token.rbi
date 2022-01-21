# typed: true
# frozen_string_literal: true

module Truby
  class Token
    def initialize(type, value)
      @type = type
      @value = value
    end

    def value
    end

    def type
    end
  end
end
