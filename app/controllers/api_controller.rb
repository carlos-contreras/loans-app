class ApiController < ActionController::API
  before_action :authenticate_request

  attr_reader :current_user

  def ping
    render json: { status: 'ok' }
  end

  private

  def check_admin_role
    unless current_user.role == "admin"
      render json: { error: 'Requires elevated role' }, status: :forbidden
    end
  end

  def authenticate_request
    command = AuthorizeApiRequest.new(request.headers).call
    @current_user = command.result

    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  end
end
