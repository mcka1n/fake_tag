# FakeTag

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'fake_tag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake_tag

## Usage

	class Tag
		extend FakeTag::Base
	end


  Tag.generate

### Generate an array with a random amount of tags

  Tag.generate

response

  ["car", "selfie", "love", "bike"]

### Generate a specific amount of tags

  Tag.generate 3

response

  ["v60", "dress", "lipstick"]


## Contributing

1. Fork it ( https://github.com/mcka1n/fake_tag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
