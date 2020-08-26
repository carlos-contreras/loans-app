class ApiController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  def ping
    render json: { status: 'ok' }
  end

  private

  def authenticate_request
    command = AuthorizeApiRequest.new(request.headers).call
    @current_user = command.result

    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
