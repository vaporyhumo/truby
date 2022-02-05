# typed: strict
# frozen_string_literal: true

module Truby
  class Struct < Object
    include T::Props
    include T::Props::Serializable
    include T::Props::Constructor
  end
end
