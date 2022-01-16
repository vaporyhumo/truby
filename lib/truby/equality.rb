# frozen_string_literal: true

module Truby
  module Equality
    def define_equality(*args)
      define_method(:==)   { |other| raise unless other.is_a?(self.class); args.all? { public_send(_1) ==   other.public_send(_1) } }
      define_method(:eql?) { |other| raise unless other.is_a?(self.class); args.all? { public_send(_1).eql? other.public_send(_1) } }
    end
  end
end
