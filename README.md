# PlantToxicity

----------Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/plant_toxicity`. To experiment with that code, run `bin/console` for an interactive prompt.

----------TODO: Delete this and the text above, and describe your gem

Welcome to the Plant Toxicity gem! It can be used to obtain and display information about many common plants from the ASPCA website. The tool can provide a list plants for each letter of the alphabet, based on the first letter in the plant's name, as well as details about each plant and its toxicity to pets. It will indicate whether a plant is toxic to dogs, cats, and/or horses, and, if it is toxic, it will provide the clinical signs of poisoning.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plant_toxicity'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plant_toxicity

## Usage

---------TODO: Write usage instructions here

The gem will use a CLI to obtain user input about which details to display, and it will scrape the ASPCA website for the relevant information. When prompted, it will create a List object for the specified letter (A to Z) which contains the plants that correspond to that letter. Each Plant object will include the plant's name and the url where additional details can be found, and the user can request additional details about a specific plant. When further information is requested, the gem will obtain the following for that plant, if available and applicable: scientific name, other common names, toxicity, non-toxicity, and clinical signs.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'vmcmiller-72282'/plant_toxicity. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
