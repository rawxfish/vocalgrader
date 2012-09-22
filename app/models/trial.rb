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


	has_one :trial_expected_edge, foreign_key: "trial_id", dependent: :destroy
	has_one :expected, :through => :trial_expected_edge,  source: :wave

	has_one :trial_actual_edge, foreign_key: "trial_id", dependent: :destroy
	has_one :actual, :through => :trial_actual_edge,  source: :wave


end
