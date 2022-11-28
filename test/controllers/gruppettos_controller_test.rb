require "test_helper"

class GruppettosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gruppettos_index_url
    assert_response :success
  end

  test "should get show" do
    get gruppettos_show_url
    assert_response :success
  end

  test "should get new" do
    get gruppettos_new_url
    assert_response :success
  end

  test "should get create" do
    get gruppettos_create_url
    assert_response :success
  end
end
