# == Schema Information
#
# Table name: movieusers
#
#  id         :integer         not null, primary key
#  name       :string
#  provider   :string
#  uid        :string
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Movieuser < ApplicationRecord
    has_many :reviews
    has_many :movies, :through => :reviews
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    end
end
