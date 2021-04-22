require 'test_helper'

class RehabilitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rehabilitations_index_url
    assert_response :success
  end

  test "should get new" do
    get rehabilitations_new_url
    assert_response :success
  end

  test "should get create" do
    get rehabilitations_create_url
    assert_response :success
  end

  test "should get show" do
    get rehabilitations_show_url
    assert_response :success
  end

  test "should get edit" do
    get rehabilitations_edit_url
    assert_response :success
  end

  test "should get update" do
    get rehabilitations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get rehabilitations_destroy_url
    assert_response :success
  end
end
