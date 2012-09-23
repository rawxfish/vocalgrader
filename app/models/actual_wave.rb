# == Schema Information
#
# Table name: actual_waves
#
#  id                :integer          not null, primary key
#  trial_id          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class ActualWave < ActiveRecord::Base
	attr_accessible :file
	belongs_to :trial

	has_attached_file :file, :path => "uploads/:id-actual.:extension"
	validates_attachment_presence :file, :content_type => 'audio/x-wav'


	def picture_from_url(url)
		self.file = open(url)
	end

	private
	def notes_output_path
		"output-data/#{:id}-actual-notes.txt"
	end

	def expected_notes_output_path
		id = self.trial.expected_wave.id
		"output-data/#{:id}-expected-notes.txt"
	end
end
