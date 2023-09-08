require 'test_helper'

class CommoditiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commodities_index_url
    assert_response :success
  end

end
