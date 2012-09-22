# == Schema Information
#
# Table name: trials
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  expected   :string(255)
#  actual     :string(255)
#  grade_1    :integer
#  grade_2    :integer
#  grade_3    :integer
#  grade_4    :integer
#  grade_5    :integer
#  grade_6    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trial < ActiveRecord::Base
  attr_accessible :actual, :expected, :name
  belongs_to :user
  
  has_one :expected, :as => :musician
  has_one :actual, :as => :musician


end
