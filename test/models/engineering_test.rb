require "test_helper"

class EngineeringTest < ActiveSupport::TestCase
  
  test 'should not save when subject is blank' do
    engineering = Engineering.new(subject: "", description: "subject description", units: 3)
    assert_not engineering.save
    assert_equal engineering.errors.full_messages.to_sentence, "Subject can't be blank"
  end

  test 'should not save when description is blank' do
    engineering = Engineering.new(subject: "Math", description: "", units: 3)
    assert_not engineering.save
    assert_equal engineering.errors.full_messages.to_sentence, "Description can't be blank and Description is too short (minimum is 10 characters)"
  end

  test 'should not save when units is blank' do
    engineering = Engineering.new(subject: "Math", description: "subject description", units: "")
    assert_not engineering.save
    assert_equal engineering.errors.full_messages.to_sentence, "Units can't be blank and Units is not a number"
  end

  test 'should not save when description is less than 10 characters' do
    engineering = Engineering.new(subject: "Math", description: "sub", units: 3)
    assert_not engineering.save
    assert_equal engineering.errors.full_messages.to_sentence, "Description is too short (minimum is 10 characters)"
  end

  test 'should not save when units is not a number' do
    engineering = Engineering.new(subject: "Math", description: "subject description", units: "not a number")
    assert_not engineering.save
    assert_equal engineering.errors.full_messages.to_sentence, "Units is not a number"
  end

  test 'should save when every input requirement is correct' do
    engineering = Engineering.new(subject: "Math", description: "subject description", units: 3)
    assert engineering.save
  end
  
end
