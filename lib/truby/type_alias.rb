# frozen_string_literal: true

module Truby
  TypeAlias = Object.new

  NilNode = T.type_alias { T.nilable Node }
  NilToken = T.type_alias { T.nilable Token }
end
