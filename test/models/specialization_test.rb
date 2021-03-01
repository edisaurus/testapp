require "test_helper"

class SpecializationTest < ActiveSupport::TestCase
  
  test 'should not save when the branch is blank' do
    specialization = Specialization.new(branch: "", description: "branch description")
    assert_not specialization.save
    assert_equal specialization.errors.full_messages.to_sentence, "Branch can't be blank and Engineering must exist"
  end
  
  test 'should not save when the description is blank and less than 10 characters' do
    specialization = Specialization.new(branch: "Subject Branch", description: "")
    assert_not specialization.save
    assert_equal specialization.errors.full_messages.to_sentence, "Description can't be blank, Description is too short (minimum is 10 characters), and Engineering must exist"
  end

  test 'should save when every input is correct' do
    engineering = Engineering.create(subject: "Math", description: "subject description", units: 3)
    specialization = engineering.specializations.create(branch: "Trigonometry", description: "branch description")
    assert specialization.save
  end
  
end
