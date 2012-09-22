# == Schema Information
#
# Table name: texts
#
#  id         :integer          not null, primary key
#  path       :string(255)
#  wave_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Text < ActiveRecord::Base
	attr_accessible :path
	validates :wave_id, presence: true 

	belongs_to :wave
	
end
