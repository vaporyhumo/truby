# frozen_string_literal: true

module Truby
  module Singleton
    SINGLETONS = %w[false nil true].freeze

    def self.=== obj
      SINGLETONS.include? obj
    end
  end
end
