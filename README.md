# BsonObjectIdValidations

Provides an ActiveModel validation that checks if an attribute represents a legal BSON::ObjectId .


# Installation

Add this line to your application's Gemfile:

    gem 'bson_object_id_validations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bson_object_id_validations


# Usage

Validate that the specified attribute's value is a legal BSON::ObjectId .

```ruby
class User
  include ActiveModel::Validations

  attr_accessor :mongo_id

  validates :mongo_id, :legal_bson_object_id => true
end

user = User.new :mongo_id => "invalid"

user.valid?
=> false

user.errors
=> {:mongo_id=>["is an invalid BSON::ObjectId"]}

user.mongo_id = BSON::ObjectId.new.to_s

user.valid?
=> true
```


# Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to your branch (`git push origin my-new-feature`)
5. Send a pull request
