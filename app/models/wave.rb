# == Schema Information
#
# Table name: waves
#
#  id         :integer          not null, primary key
#  path       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wave < ActiveRecord::Base
	attr_accessible :path

	has_many :trial_expected_edges, foreign_key: "wave_id", dependent: :destroy
	has_many :expected_trials, :through => :trial_expected_edges, source: :trial

	has_many :trial_actual_edges, foreign_key: "wave_id", dependent: :destroy
	has_many :actual_trials, :through => :trial_actual_edges, source: :trial

	has_many :texts, dependent: :destroy

	

end
