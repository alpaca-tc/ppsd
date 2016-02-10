$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'ppsd'
require 'pry'

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.order = :random
  config.profile_examples = 10

  unless ENV['CIRCLECI']
    config.filter_run :focus
    config.run_all_when_everything_filtered = true
  end

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
