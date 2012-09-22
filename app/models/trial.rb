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


	has_many :trial_wave_edges, foreign_key: "trial_id", dependent: :destroy
	has_many :expected, :through => :trial_wave_edges,  source: :trial
	has_many :actual, :through => :trial_wave_edges,  source: :trial


end
