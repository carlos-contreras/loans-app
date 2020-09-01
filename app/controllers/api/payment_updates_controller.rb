module Api
  class PaymentUpdatesController < ApiController
    before_action :check_admin_role
    before_action :load_payment_update, only: %i[show update delete]

    # GET api/users
    def index
      payment_updates = PaymentUpdate.all

      render json: PaymentUpdateSerializer.new(payment_updates, is_collection: true).serializable_hash
    end

    # POST api/users
    def create
      payment = Loan.new(payment_update_params)

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
      if @payment.update(payment_update_params)
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

    def payment_update_params
      params.require(:payment_update).permit(:loan_id, :status, :note)
    end

    def load_payment_update
      @payment_update = PaymentUpdate.find(params[:id])

      if @payment_update.blank?
        render json: { error: 'Payment update not found' }, status: :not_found
      end
    end
  end
end
