# typed: true
# frozen_string_literal: true

module Truby
  module Singleton
    SINGLETONS = %w[false nil true].freeze

    sig { params(obj: String).returns T::Boolean }
    def self.=== obj
      SINGLETONS.include? obj
    end
  end
end
