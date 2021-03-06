module Api
  class AuthenticationsController < ApiController
    skip_before_action :authenticate_request

    def create
      command = AuthenticateUser.new(params[:email], params[:password]).call

      if command.success?
        render json: { auth_token: command.result }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end
  end
end
