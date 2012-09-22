# == Schema Information
#
# Table name: actual_waves
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class ActualWave < ActiveRecord::Base
	attr_accessible :user_id, :trial_id

	belongs_to :trial
	attr_accessible :file

	has_attached_file :file, :path => "uploads/#{:id}-actual.:extension"
	validates_attachment_presence :file, :content_type => 'audio/x-wav'


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


	def notes_output_path
		"output-data/#{:id}-actual-notes.txt"
	end

	def expected_notes_output_path
		id = self.trial.expected_wave.id
		"output-data/#{id}-expected-notes.txt"
	end
end
