# frozen_string_literal: true

module Truby
  class Node
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
    end
  end
end
