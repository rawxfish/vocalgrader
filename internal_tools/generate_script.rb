#!/user/bin/env ruby

id = ARGV.first

file = File.new("internal_tools/script_#{id}.sh". 'w')

file.puts("#!/bin/bash\n")
file.puts("aubionotes -i uploads/#{id}.wav -v > trial_data/#{id}-notes\n")
file.puts("aubiotrack -i uploads/#{id}.wav -v > trial_data/#{id}-track\n")
file.close

system("chmod +x internal_tools/script_#{id}.sh")
system("internal_tools/script_#{id}.sh")
