require "test_helper"

class CreateEngineeringTest < ActionDispatch::IntegrationTest
    test "should go to new subject and successfully create a new subject in engineering" do
        get new_engineering_path
        assert_response :success
        assert_difference('Engineering.count', 1) do
            post engineerings_path, params: { engineering: { subject: "New Subject",
                                                                   description: "New subject description",
                                                                   units: 3 } }
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end
end