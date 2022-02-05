# frozen_string_literal: true

module Truby
  TypeAlias = Object.new

  NilNode = T.type_alias { T.nilable Node }
  NilString = T.type_alias { T.nilable String }
  NilToken = T.type_alias { T.nilable Token }
end
