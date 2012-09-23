# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  password   :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  provider   :string(255)
#  uid        :string(255)
#

class User < ActiveRecord::Base

	attr_accessible :email, :name, :password, :provider, :uid, :trials
	has_many :trials, dependent: :destroy

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			if auth["info"]
				user.name = auth["info"]["name"] || ""
				user.email = auth['info']['email'] || ""
			end
		end
	end
end
