class PaymentsController < ApplicationController

  # GET /payments or /payments.json
  def index
    @payments = Payment.all
  end

end
