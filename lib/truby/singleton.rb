# frozen_string_literal: true

module Truby
  module Singleton
    SINGLETONS = %w[false nil true].freeze

    def self.=== obj
      Boolean SINGLETONS.include? String obj
    end
  end
end
