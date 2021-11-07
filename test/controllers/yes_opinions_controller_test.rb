require 'test_helper'

class YesOpinionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get yes_opinions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get yes_opinions_destroy_url
    assert_response :success
  end

end
