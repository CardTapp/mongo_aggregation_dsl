# mongo_aggregation_dsl

This gem provides a basic implementation of a mongo aggregation dsl. It is by no means complete.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongo_aggregation_dsl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongo_aggregation_dsl
    
## Usage    

Example returns an array containing the resulting document json
```ruby
Aggregate::Pipeline.new(User).
        match(account_id: BSON::ObjectId("111111111111111")).
        project(id: 1).
        lookup(
            from: EndUser,
            let: { user_id: :"$id" },
            as: "my_record",
            pipeline: Aggregate::Pipeline.new.
                match(
                    :expr.and => [
                        { eq: %w[$user_id $$user_id] },
                        { eq: ["$status_code", 1] }
                    ]
                ).
                project(id: 1)
        ).execute
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests. 

To release a new version, update the version number in `mongo_aggregation_dsl.gemspec`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CardTapp/mongo_aggregation_dsl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

