class AuthenticateUser
  attr_accessor :errors, :result

  def initialize(email, password)
    @email = email
    @password = password
    @errors = {}
  end

  def call
    @result = JsonWebToken.encode(user_id: user.id) if user
    self
  end

  def success?
    errors.empty?
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors[:user_authentication] = 'invalid credentials'
    nil
  end
end
