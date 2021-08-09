# frozen_string_literal: true

class User
  class FromOmniAuth
    def self.call(auth)
      User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.skip_confirmation!
      end
    end
  end
end
