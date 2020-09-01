module Api
  class MeController < ApiController
    # GET api/users/:id
    def show
      render json: UserSerializer.new(current_user).serializable_hash
    end

    # PATCH api/users/:id
    def update
      if @user.update(user_params)
        render json: UserSerializer.new(current_user.reload).serializable_hash
      else
        render json: { error: user.errors }
      end
    end

    private

    def user_params
      params.require(:user)
        .permit(:email, :password, :password_confirmation, :full_name, :address_line_1,
          :address_line_2, :zip_code, :mobile_phone)
    end
  end
end
