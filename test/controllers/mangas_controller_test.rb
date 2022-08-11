require "test_helper"

class MangasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mangas_show_url
    assert_response :success
  end
end
