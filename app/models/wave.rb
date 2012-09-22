# == Schema Information
#
# Table name: waves
#
#  id            :integer          not null, primary key
#  path          :string(255)
#  musician_id   :integer
#  musician_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Wave < ActiveRecord::Base
	attr_accessible :path

	belongs_to :musician, :polymorphic => true
end
