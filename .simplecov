# typed: strict
# frozen_string_literal: true

require 'sorbet-runtime'

SimpleCov.start do
  T.bind(self, T.class_of(SimpleCov))

  enable_coverage :branch
  primary_coverage :branch

  minimum_coverage line: 100, branch: 100
  minimum_coverage_by_file line: 100, branch: 100
  refuse_coverage_drop :line, :branch

  add_filter 'spec/'
end
