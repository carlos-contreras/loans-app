module Api
  class LoansController < ApiController
    before_action :check_admin_role
    before_action :load_loan, only: %i[show update delete]

    # GET api/users
    def index
      loans = Loan.all

      render json: LoanSerializer.new(loans, is_collection: true).serializable_hash
    end

    # POST api/users
    def create
      loan = Loan.new(loan_params)

      if loan.save
        render json: LoanSerializer.new(loan).serializable_hash
      else
        render json: { error: loan.errors }, status: :unprocessable_entity
      end
    end

    # GET api/users/:id
    def show
      render json: LoanSerializer.new(@loan).serializable_hash
    end

    # PUT api/users/:id
    def update
      if @loan.update(loan_params)
        render json: LoanSerializer.new(@loan).serializable_hash
      else
        render json: { error: @loan.errors }, status: :unprocessable_entity
      end
    end

    # DELETE api/users/:id
    def destroy
      @loan.destroy

      render json: LoanSerializer.new(@loan).serializable_hash
    end

    private

    def loan_params
      params.require(:loan)
        .permit(:user_id, :status, :initial_amount, :interest_type, :interest_rate,
          :period_type, :periods_count, :disbursed_at, :pay_day_deadline)
    end

    def load_loan
      @loan = Loan.find(params[:id])

      if @loan.blank?
        render json: { error: 'Loan not found' }, status: :not_found
      end
    end
  end
end
