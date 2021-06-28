class PaymentController < ApplicationController
  before_action :authenticate_user!

  def service_success
    current_user.payments.create()
  end
end
