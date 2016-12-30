# Helper module for you to use on your app and in your Strategy
# Don't add "Helper" to its name and rails won't load it has a view helper module.
# "app/helpers/jwt_wrapper.rb"

module JWTWrapper
  extend self

  def encode(payload, expiration = nil)
    expiration ||= Rails.application.secrets.jwt_expiration_hours

    payload = payload.dup
    payload['exp'] = expiration.to_i.hours.from_now.to_i

    JWT.encode payload, Rails.application.secrets.jwt_secret
  end

  def decode(token)
    begin
      decoded_token = JWT.decode token, Rails.application.secrets.jwt_secret

      decoded_token.first
    rescue
      nil
    end
  end
end