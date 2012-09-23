# == Schema Information
#
# Table name: trials
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trial < ActiveRecord::Base
	attr_accessible :name
	belongs_to :user

	validates :user_id, presence: true 
	validates :name, presence: true  
	

	has_one :expected_wave, dependent: :destroy
	has_many :actual_waves, dependent: :destroy, class_name: "ActualWave"



end
