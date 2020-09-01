module Api
  class UsersController < ApiController
    before_action :check_admin_role
    before_action :load_user, only: %i[show update delete]

    # GET api/users
    def index
      users = User.all

      render json: UserSerializer.new(users, is_collection: true).serializable_hash
    end

    # POST api/users
    def create
      user = User.new(user_params)

      if user.save
        render json: UserSerializer.new(user).serializable_hash
      else
        render json: { error: user.errors }, status: :unprocessable_entity
      end
    end

    # GET api/users/:id
    def show
      render json: UserSerializer.new(@user).serializable_hash
    end

    # PUT api/users/:id
    def update
      if @user.update(user_params)
        render json: UserSerializer.new(@user).serializable_hash
      else
        render json: { error: @user.errors }, status: :unprocessable_entity
      end
    end

    # DELETE api/users/:id
    def destroy
      @user.destroy

      render json: UserSerializer.new(@user).serializable_hash
    end

    private

    def user_params
      params.require(:user)
        .permit(:email, :password, :password_confirmation, :full_name, :address_line_1,
          :address_line_2, :zip_code, :mobile_phone)
    end

    def load_user
      @user = User.find(params[:id])

      if @user.blank?
        render json: { error: 'User not found' }, status: :not_found
      end
    end
  end
end
