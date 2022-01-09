require 'test_helper'

class MyaccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get myaccounts_show_url
    assert_response :success
  end

  test "should get edit" do
    get myaccounts_edit_url
    assert_response :success
  end

end
