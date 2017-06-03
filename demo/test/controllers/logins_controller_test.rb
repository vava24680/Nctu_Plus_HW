require 'test_helper'

class LoginsControllerTest < ActionDispatch::IntegrationTest
    test "Should get new" do
        get login_path
        assert_responser :fail
    end
  # test "the truth" do
  #   assert true
  # end
end
