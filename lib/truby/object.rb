# typed: false
# frozen_string_literal: true

module Truby
  class Object < ::Object
    extend Kernel
    include Kernel

    def self.new(...)
      allocate.within { initialize(...); freeze }
    end
  end
end
