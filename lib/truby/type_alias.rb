# frozen_string_literal: true

module Truby
  TypeAlias = Object.new

  NilToken = T.type_alias { T.nilable Token }
end
