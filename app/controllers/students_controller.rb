class StudentsController < ApplicationController
  before_action :authenticate_student!, except: [:index]

  before_action :find_student, only: [:show]



    def index
      if params[:search]
        @students = Student.search(params[:search]).paginate(:page => params[:page], :per_page => 15)
      else
        @students = Student.all.paginate(:page => params[:page], :per_page => 15)
      end
    end

    def show
      @posts= Post.where(params[id: "#{:student_id}"]).order("created_at DESC").paginate(:page => params[:page], :per_page => 24)
    end
    #
    # require 'paypal-sdk-adaptivepayments'
    # PayPal::SDK.configure(
    #   :mode      => "sandbox",  # Set "live" for production
    #   :app_id    => "APP-80W284485P519543T",
    #   :username  => "jb-us-seller_api1.paypal.com",
    #   :password  => "WX4WTU3S8MY44S7F",
    #   :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31A7yDhhsPUU2XhtMoZXsWHFxu-RWy" )
    #
    #   def pay
    #     p = Print.find_by(id: params[:id])
    #     creator = Creator.find_by(id: p.creator_id)
    #     price = p.price
    #     commission = 0.05
    #
    #     # Build API call
    #     @api = PayPal::SDK::AdaptivePayments.new
    #     @pay = @api.build_pay({
    #       :actionType => "PAY",
    #       :cancelUrl => "http://localhost:3000/p/#{p.id}",
    #       :returnUrl => "http://localhost:3000/#{p.path}",
    #       :currencyCode => "USD",
    #       :feesPayer => "PRIMARYRECEIVER",
    #       :ipnNotificationUrl => "http://localhost:3000/paypal/ipn_notify",
    #       :receiverList => {
    #         :receiver => [
    #           {
    #             :amount => price,
    #             :email => "facilitator@cornell.edu",
    #             :primary => true
    #           },
    #           {
    #             :amount => price * (1 - commission),
    #             :email => "buyer@cornell.edu",
    #             :primary => false
    #           }
    #         ]
    #       },
    #       :memo => "Transaction for #{p.name}"
    #     } || default_api_value)
    #
    #     # Make API call
    #     @pay_response = @api.pay(@pay)
    #
    #     # Check if call was valid, if so, redirect to PayPal payment url
    #     if @pay_response.success?
    #       t = Transaction.create(print_id: p.id, seller_id: creator.id, )
    #       if current_user
    #         t.update(buyer_id: current_user.id)
    #       end
    #
    #       redirect_to @api.payment_url(@pay_response)
    #     else
    #       @pay_response.error
    #       redirect_to "/p/#{p.id}", alert: "Something went wrong. Please contact support."
    #     end
    #   end



    private


    def find_student
      if params[:id].nil?
        @student = current_student
      else
        @student = Student.find(params[:id])

      end

    end
end
