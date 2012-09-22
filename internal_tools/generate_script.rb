#!/user/bin/env ruby

id = ARGV.first

file = File.new("internal_tools/script_#{id}.sh". 'w')

file.puts("#!/bin/bash\n")
file.puts("aubionotes -i uploads/#{id}-expected.wav -v > trial_data/#{id}-expected-notes\n")
file.puts("aubiotrack -i uploads/#{id}-expected.wav -v > trial_data/#{id}-expected-track\n")
file.puts("aubionotes -i uploads/#{id}-actual.wav -v > trial_data/#{id}-actual-notes\n")
file.puts("aubiotrack -i uploads/#{id}-actual.wav -v > trial_data/#{id}-actual-track\n")
file.close

system("chmod +x internal_tools/script_#{id}.sh")
system("internal_tools/script_#{id}.sh")
