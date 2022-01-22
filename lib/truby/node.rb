# typed: true
# frozen_string_literal: true

module Truby
  module Node
    def self.empty
      Empty::new
    end

    def self.false
      False::new
    end

    def self.nil
      Nil::new
    end

    def self.true
      True::new
    end

    def self.int value
      Int::new value
    end

    def add token
      T.bind(self, Object)
      Kernel::raise "Cannot add #{token.inspect} to #{self.inspect}"
    end
  end
end
