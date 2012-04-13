module BsonObjectIdValidations
  class LegalBsonObjectIdValidator < ActiveModel::EachValidator
    @@error_message = 'is not a legal BSON::ObjectId'

    # Validate that the specified attribute's value is a legal BSON::ObjectId .
    #
    # @example
    #   class User
    #     include ActiveModel::Validations
    #
    #     attr_accessor :mongo_id
    #
    #     validates :mongo_id, :legal_bson_object_id => true
    #   end
    #
    #   user = User.new :mongo_id => "invalid"
    #
    #   user.valid?
    #    => false
    #
    #   user.errors
    #    => {:mongo_id=>["is an invalid BSON::ObjectId"]}
    #
    #   user.mongo_id = BSON::ObjectId.new.to_s
    #
    #   user.valid?
    #    => true
    #
    def validate_each(record, attribute, value)
      error_message = options[:message] || @@error_message

      unless ::BSON::ObjectId.legal? value
        record.errors.add attribute, error_message
      end
    end
  end
end
