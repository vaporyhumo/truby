# frozen_string_literal: true

module Truby
  class Node
    def self.empty
      Node Empty::new
    end

    def self.false
      Node False::new
    end

    def self.nil
      Node Nil::new
    end

    def self.true
      Node True::new
    end

    def self.int value
      Node Int::new value
    end
  end
end
