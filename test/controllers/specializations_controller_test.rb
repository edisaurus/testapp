require "test_helper"

class SpecializationsControllerTest < ActionDispatch::IntegrationTest
  
  test "should respond to success when request goes to GET /engineerings/engineering_id/specializations" do
    post engineerings_path, params: { engineering: { subject: "Mathematics",
                                                     description: "subject description", 
                                                     units: 3 } } do
        get engineering_specializations_path
        assert_response :success
    end
    assert_response :redirect
  end

  test "should respond to success when request goes to GET /engineerings/engineerings_id/specializations/new" do
    post engineerings_path, params: { engineering: { subject: "Mathematics",
                                                     description: "subject description", 
                                                     units: 3 } } do
        get new_engineering_specializations_path
        assert_response :success
    end
    assert_response :redirect
  end

  test "should respond to success when request goes to POST /engineerings/engineering_id/specializations" do
    post engineerings_path, params: { engineering: { subject: "Mathematics",
                                                     description: "subject description", 
                                                     units: 3 } } do
      post engineering_specializations_path
      assert_response :redirect
    end
    assert_response :redirect
  end
end
