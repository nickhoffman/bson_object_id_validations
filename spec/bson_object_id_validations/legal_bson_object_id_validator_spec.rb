require 'spec_helper'

describe BsonObjectIdValidations::LegalBsonObjectIdValidator  do
  class User
    include ActiveModel::Validations
    include BsonObjectIdValidations

    attr_accessor :mongo_id_1
    attr_accessor :mongo_id_2

    validates :mongo_id_1, :legal_bson_object_id => true
    validates :mongo_id_2, :legal_bson_object_id => {:message => 'a custom error message'}
  end

  it 'inherits from ActiveModel::EachValidator' do
    described_class.superclass.should equal ActiveModel::EachValidator
  end

  describe 'class variables' do # {{{
    it 'has @@error_message' do
      described_class.class_variable_get(:@@error_message).
        should == 'is an invalid BSON::ObjectId'
    end
  end # }}}

  describe '#validate_each' do # {{{
    let(:user) do
      User.new :mongo_id_1 => 'invalid'
    end

    context 'when the attribute contains an invalid value' do # {{{
      it 'adds an error on the attribute' do
        user.valid?
        user.errors[:mongo_id_1].count.should be 1
      end

      it 'uses the standard error message' do
        user.valid?
        user.errors[:mongo_id_1].should == ['is an invalid BSON::ObjectId']
      end

      context 'when a custom error message is provided' do # {{{
        let(:user) do
          User.new :mongo_id_2 => 'invalid'
        end

        it 'uses the custom error message' do
          user.valid?
          user.errors[:mongo_id_2].should == ['a custom error message']
        end
      end # }}}
    end # }}}
  end # }}}
end
