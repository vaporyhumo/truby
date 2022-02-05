# typed: false
# frozen_string_literal: true

module Truby
  module Kernel
    def within(&blk)
      instance_eval(&blk)
      self
    end
  end
end
