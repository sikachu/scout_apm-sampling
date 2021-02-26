# Scout APM Sampling

This gem adds sampling feature to [scout\_apm][1] gem
base on the recommendations in [Scout APM's documentation][2].

[1]: https://github.com/scoutapp/scout_apm_ruby
[2]: https://docs.scoutapm.com/#sampling-web-requests

## How does this work?

This gem is designed to work with a Ruby on Rails application.

Once installed, this gem will add `before_action` and `before_enqueue` callbacks
to `ActionController:Base` and `ActiveJob::Base` which calculates probability
and make Scout ignore current transaction if it falls under the threshold.

## Installation

Add this line to your application's Gemfile:

    gem "scout_apm-sampling"

And then execute:

    $ bundle install

## Configuration

There are a few ways you can configure the sampling rate.

Note that sampling rate should be a decimal ranging from 0-1:

* 0: captures no requests
* 0.75: captures 75% of the requests
* 1: captures all requests

### Using an environment variable

You can set a sampling rate using `SCOUT_APM_SAMPLING_RATE` environment variable.
This value will be used as the default sampling rate in your application.

    export SCOUT_APM_SAMPLING_RATE=0.01 # Sample only 1% of the requests

You can also set `SCOUT_APM_WEB_SAMPLING_RATE` and
`SCOUT_APM_WORKER_SAMPLING_RATE` in case you want a different sampling rate
between web endpoints and your workers.

    # Only sampling 5% of the web requests, but 50% of the workers
    export SCOUT_APM_WEB_SAMPLING_RATE=0.05
    export SCOUT_APM_WORKER_SAMPLING_RATE=0.5

Note that these two environment variables will take precedent over
`SCOUT_APM_SAMPLING_RATE`.

By default, this gem sets `SCOUT_APM_SAMPLING_RATE` to `1` to capture all of
the requests.

### Inside your controller or job

In case you want to sample a particular endpoint or jobs with a different rate
than the default rate from the envinronment variable, you can call
`set_scout_apm_sample_rate` in your controller or job:

#### Inside a controller

    class UsersController < ApplicationController
      # Applying sample rate to the whole controller
      set_scout_apm_sample_rate 0.75

      # Applying sample rate to specific action
      set_scout_apm_sample_rate 0.1, only: :show
      set_scout_apm_sample_rate 1, only: [:create, :destroy]

#### Inside a job

    class UserCreationJob < ApplicationJob
      set_scout_apm_sample_rate 0.5

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on
[GitHub](https://github.com/sikachu/scout_apm-sampling). This project is
intended to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the
[code of conduct](https://github.com/sikachu/scout_apm-sampling/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

Please note that this gem is created and maintained by third parties and not
affiliated with Scout APM or Zimuth, Inc. All product names and trademarks
referred to are the property of their respective owners. 

## Code of Conduct

Everyone interacting in the this project's codebases, issue
trackers, chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/sikachu/scout_apm-sampling/blob/main/CODE_OF_CONDUCT.md).
