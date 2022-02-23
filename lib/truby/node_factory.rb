# typed: strict
# frozen_string_literal: true

module Truby
  module NodeFactory
    sig { params(type: Symbol, args: T::untyped).returns Node }
    def s(type, *args)
      case type
      when :const        then Node::Const::new(receiver: args[0], name: args[1], tokens: ::Kernel::Array(args[2]))
      when :empty        then Node::Empty::new tokens: args[0]
      when :false        then Node::False::new(tokens: args[0])
      when :int          then Node::Int::new(value: args[0], tokens: args[1] || [])
      when :lvar_assign  then Node::LvarAssign::new(id: args[0], value: args[1], tokens: args[2])
      when :nil          then Node::Nil::new(tokens: args[0])
      when :send         then Node::Send::new(receiver: args[0], message: args[1], tokens: [])
      when :tlvar_assign then Node::TlvarAssign::new(type: args[0], id: args[1], value: args[2], tokens: args[3])
      when :true         then Node::True::new(tokens: args[0])
      when :tsend        then Node::TSend::new(type: args[0], receiver: args[1], message: args[2], tokens: args[3])
      end
    end
  end
end
