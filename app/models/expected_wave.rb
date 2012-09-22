class ExpectedWave < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :trial
end
