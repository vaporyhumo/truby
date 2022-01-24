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

    sig { returns Node::False  }
    def self.false
      False::new
    end

    sig { returns Node::Nil  }
    def self.nil
      Nil::new
    end

    sig { returns Node::True  }
    def self.true
      True::new
    end

    sig { params(value: String).returns Node::Int  }
    def self.int value
      Int::new value
    end

    sig { params(other: Node).returns T::Boolean }
    def == other
      other.inspect == inspect
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
  end
end
