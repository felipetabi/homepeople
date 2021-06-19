require "test_helper"

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get exito" do
    get payment_exito_url
    assert_response :success
  end
end
