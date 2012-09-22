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
  attr_accessible :email, :name, :password, :provider, :uid

    has_many :trials, dependent: :destroy

end
