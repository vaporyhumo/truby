# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    extend T::Helpers
    include Kernel

    abstract!

    sig { returns Node::Empty  }
    def self.empty
      Empty::new
    end

    sig { params(token: Token).returns Node  }
    def add token
      raise ArgumentError, "Cannot add #{token.inspect} to #{inspect}"
    end

    sig { abstract.returns String }
    def inspect; end

    sig { abstract.returns T::Array[Token] }
    def tokens
    end

    sig { params(other: Node).returns(T::Boolean) }
    def == other
      tokens.size.equal?(other.tokens.size) &&
        tokens.zip(other.tokens).all? { |a, b| a.eql? b } && self.class.equal?(other.class)
    end
  end
end
