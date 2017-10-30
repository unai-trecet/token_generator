# TokenGenerator
The perfect gem to easelly generate unique tokens with a custom format for specified models for Rails 5 apps. The tokens are based on Capital letters, from A-Z grouped by blocks with a custom separator: ANSM-UEIJC-PIUM

## Usage
Add gem 'token_generator' to your Gemfile file and run 'bundle install'.
On application_record.rb file add 'include TokenGenerator'.
```ruby
class ApplicationRecord < ActiveRecord::Base
  include TokenGenerator
  self.abstract_class = true
end
```

On the models where it is needed to generate tokens,
Include the following line in its Model file: set_token
```ruby
class Letter < ApplicationRecord
  set_token({ attribute: 'security_token' })
end
```

The gem accepts the following attributes to customize the token:
 block_number: to set how many block of chars is needed.
 block_length: how many characters per block is needed.
 separator: defines the separator between each block.
 attribute: defines for which model attribute the token will be generated.

 Emxample: set_token({ block_length: 2, separator: '&', blocks_number: 4, attribute: 'identify' }) defined on a specific model would generate the following token: 'AB&ZT&BV&IO'

 By default, the gem generates a token with the following settings: { block_length: 4, separator: '-', blocks_number: 2, attribute: 'identify' }
 Which generates a token like: 'KIET-ZIDS'

In application

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'token_generator'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install token_generator
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
