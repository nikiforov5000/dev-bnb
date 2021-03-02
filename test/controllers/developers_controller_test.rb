require 'test_helper'

class DevelopersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get developers_new_url
    assert_response :success
  end

  test "should get create" do
    get developers_create_url
    assert_response :success
  end

end
