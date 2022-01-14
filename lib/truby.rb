# frozen_string_literal: true

module Truby
  def self.lex(string)
    [[string.to_sym]]
  end

  def self.transpile(string)
    string
  end
end
