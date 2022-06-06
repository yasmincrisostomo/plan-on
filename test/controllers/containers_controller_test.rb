require "test_helper"

class ContainersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get containers_new_url
    assert_response :success
  end

  test "should get create" do
    get containers_create_url
    assert_response :success
  end

  test "should get edit" do
    get containers_edit_url
    assert_response :success
  end

  test "should get update" do
    get containers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get containers_destroy_url
    assert_response :success
  end
end
