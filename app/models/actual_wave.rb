# == Schema Information
#
# Table name: actual_waves
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ActualWave < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :trial



  	def size
		File.open(beat_data, "r").readlines.size - 1
	end

	def mean
		m = 0
		prev_data = File.open(beat_data, "r").readline
		File.open(beat_data, "r").each_line do |data|
			m = m + (data.to_f - prev_data.to_f)
			prev_data = data
		end
		m = m / size
	end

	def std_dev
		m = mean
		s = 0
		prev_data = File.open(beat_data, "r").readline

		File.open(beat_data, "r").each_line do |data|
			unless prev_data == data
				d = (data.to_f - prev_data.to_f) - m
				prev_data = data
				s = s + d * d
			end
		end
		m = Math.sqrt(s / size)
	end

	def z_test
		z_score = (mean - correct_tempo) / (std_dev / Math.sqrt(size))
	end
end
