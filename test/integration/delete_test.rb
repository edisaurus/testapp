require "test_helper"

class DeleteEngineeringTest < ActionDispatch::IntegrationTest
    test "should delete subject adn redirect to index page" do
        engineering = engineerings(:one)
        assert_difference("Engineering.count", -1) do
        delete engineering_path(engineering)
        end
        assert_redirected_to engineerings_path
    end
end