require "test_helper"

class UpdateEngineeringTest < ActionDispatch::IntegrationTest
    test "should update subject and redirect to show page" do
        engineering = engineerings(:one)
        put engineering_path(engineering), params: { engineering: { subject: "Updated Subject", 
                                                                    description: "updated subject description", 
                                                                    units: 3 } }
        assert_redirected_to engineering_path(engineering)
        engineering.reload
        assert_equal "Updated Subject", engineering.subject
        post engineerings_path, params: { engineering: { subject: "Updated Subject",
                                                         description: "updated subject description", 
                                                         units: 3 } }
        assert_response :redirect
    end
end