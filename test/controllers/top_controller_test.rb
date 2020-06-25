require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get sitemap" do
    get top_sitemap_url
    assert_response :success
  end

end
