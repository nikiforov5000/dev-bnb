require 'test_helper'

class DeveloperSkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get developer_skills_new_url
    assert_response :success
  end

  test "should get create" do
    get developer_skills_create_url
    assert_response :success
  end

  test "should get edit" do
    get developer_skills_edit_url
    assert_response :success
  end

  test "should get update" do
    get developer_skills_update_url
    assert_response :success
  end

  test "should get destroy" do
    get developer_skills_destroy_url
    assert_response :success
  end

end
