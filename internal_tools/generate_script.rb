#!/user/bin/env ruby

id1 = ARGV[0]
id2 = ARGV[1]


system("aubionotes -i uploads/#{id1}-expected.wav -v > trial_data/#{id1}-expected-notes\n")
system("aubiotrack -i uploads/#{id1}-expected.wav -v > trial_data/#{id1}-expected-track\n")
system("aubionotes -i uploads/#{id2}-actual.wav -v > trial_data/#{id2}-actual-notes\n")
system("aubiotrack -i uploads/#{id2}-actual.wav -v > trial_data/#{id2}-actual-track\n")
system("internal_tools/judge1 #{id1} #{id2}")
