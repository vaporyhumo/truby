# typed: strict
# frozen_string_literal: true

module Truby
  module NodeFactory
    sig { params(type: Symbol, receiver: T.nilable(String), name: ::String, tokens: T::Array[Token]).returns Node }
    def s(type, receiver, name, tokens)
      Node::Const::new(receiver: nil, name: name, tokens: tokens)
    end
  end
end
