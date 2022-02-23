# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    extend T::Helpers
    include ::Kernel
    include NodeFactory

    abstract!

    sig { returns Node::Empty  }
    def self.empty
      Empty::new
    end

    sig { params(token: Token).returns Node  }
    def add token
      raise ArgumentError, "Cannot add #{token} to #{self}"
    end

    sig { abstract.returns String }
    def inspect; end

    sig { abstract.returns T::Array[Token] }
    def tokens
    end

    sig { params(other: Node).returns(T::Boolean) }
    def == other
      serialize == other.serialize
    end

    sig { abstract.returns T::Hash[String, T::untyped] }
    def serialize
    end

    sig { returns String }
    def display_tokens
      "[#{tokens.map(&:to_s).join(' ')}]"
    end

    sig { abstract.returns String }
    def transpile
    end
  end
end
