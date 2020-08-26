# ref: https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api#module-encodinganddecodingjwttokens
class JsonWebToken
  class << self
    def encode(payload, exp = 1.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
 end