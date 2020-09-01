module Api
  class LoanUpdatesController < ApiController
    before_action :check_admin_role
    before_action :load_loan_update, only: %i[show update delete]

    # GET api/users
    def index
      loan_updates = LoanUpdate.all

      render json: LoanUpdateSerializer.new(loan_updates, is_collection: true).serializable_hash
    end

    # POST api/users
    def create
      loan_update = Loan.new(loan_update_params)

      if loan_update.save
        render json: LoanUpdateSerializer.new(loan_update).serializable_hash
      else
        render json: { error: loan_update.errors }, status: :unprocessable_entity
      end
    end

    # GET api/users/:id
    def show
      render json: LoanUpdateSerializer.new(@loan_update).serializable_hash
    end

    # PUT api/users/:id
    def update
      if @loan_update.update(loan_update_params)
        render json: LoanUpdateSerializer.new(@loan_update).serializable_hash
      else
        render json: { error: @loan_update.errors }, status: :unprocessable_entity
      end
    end

    # DELETE api/users/:id
    def destroy
      @loan_update.destroy

      render json: LoanUpdateSerializer.new(@loan_update).serializable_hash
    end

    private

    def loan_update_params
      params.require(:loan_update).permit(:loan_id, :status, :note)
    end

    def load_loan_update
      @loan_update = LoanUpdate.find(params[:id])

      if @loan_update.blank?
        render json: { error: 'Loan update not found' }, status: :not_found
      end
    end
  end
end
