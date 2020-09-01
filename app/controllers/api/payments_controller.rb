module Api
  class PaymentsController < ApiController
    before_action :check_admin_role
    before_action :load_payment, only: %i[show update delete]

    # GET api/users
    def index
      payments = Payment.all

      render json: PaymentSerializer.new(payments, is_collection: true).serializable_hash
    end

    # POST api/users
    def create
      payment = Payment.new(payment_params)

      if payment.save
        render json: PaymentSerializer.new(payment).serializable_hash
      else
        render json: { error: payment.errors }, status: :unprocessable_entity
      end
    end

    # GET api/users/:id
    def show
      render json: PaymentSerializer.new(@payment).serializable_hash
    end

    # PUT api/users/:id
    def update
      if @payment.update(payment_params)
        render json: PaymentSerializer.new(@payment).serializable_hash
      else
        render json: { error: @payment.errors }, status: :unprocessable_entity
      end
    end

    # DELETE api/users/:id
    def destroy
      @payment.destroy

      render json: PaymentSerializer.new(@payment).serializable_hash
    end

    private

    def payment_params
      params.require(:payment).permit(:loan_id, :status, :note)
    end

    def load_payment
      @payment = Payment.find(params[:id])

      if @payment.blank?
        render json: { error: 'Payment not found' }, status: :not_found
      end
    end
  end
end
