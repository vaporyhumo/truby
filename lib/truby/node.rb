# typed: strict
# frozen_string_literal: true

module Truby
  module Node
    extend T::Helpers

    abstract!

    sig { returns Node::Empty  }
    def self.empty
      Empty::new
    end

    sig { params(id: String, value: NilNode, tokens: T::Array[Token]).returns Node::LvarAssign }
    def self.lvar_assign id, value, tokens
      LvarAssign::new id, value, tokens
    end

    sig { params(token: Token).returns Node  }
    def add token
      T.bind(self, Object)
      Kernel::raise "Cannot add #{token.inspect} to #{self.inspect}"
    end

    sig { abstract.returns String }
    def inspect; end

    sig { abstract.returns T::Array[Token] }
    def tokens
    end

    sig { params(other: Object).returns(T::Boolean) }
    def == other
      return false unless other.is_a?(Node)

      tokens.zip(other.tokens).all? { |a, b| a == b }
    end
  end
end
