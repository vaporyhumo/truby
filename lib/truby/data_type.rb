# typed: true
# frozen_string_literal: true

module Truby
  module DataType
    include Equality

    def self.new **attributes, &blk
      Class.new do
        extend DataType

        T.unsafe(self).define_type **attributes
        class_eval &blk if blk
      end
    end

    def define_type(attributes = {})
      T.bind(self, Class)

      define_method :initialize do |*args|
        attributes.zip(args).each do |(attribute, klass), value|
          instance_variable_set("@#{attribute}", value.tap { raise TypeError, {value: value, attribute: attribute, klass: klass}.to_s unless _1.is_a? klass })
        end
      end

      define_singleton_method :__type do
        attributes
      end

      attr_reader *attributes.keys
      define_equality *attributes.keys
    end
  end
end
